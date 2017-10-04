using Carfinance.Poolleague.Gateway.Api.Services;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Carfinance.Poolleague.Gateway.Api.Repository
{
    public class GenericRepository<TEntity> : IGenericRepository<TEntity>
    {
        private readonly IDbConnectionFactory _dbConnectionFactory;
        private readonly string _genericTypeName;
        public GenericRepository(IDbConnectionFactory dbConnectionFactory)
        {
            _dbConnectionFactory = dbConnectionFactory;
            _genericTypeName = typeof(GenericRepository<TEntity>).GetGenericArguments()[0].Name;
        }

        public async Task<TEntity> CreateAsync(TEntity entity)
        {
            var storeProc = $"dbo.{_genericTypeName}_Insert";

            using (var conn = _dbConnectionFactory.CreateConnection())
            {
                DynamicParameters parameters = Mapping(entity, true);
                var Id = await conn.ExecuteScalarAsync(storeProc, parameters, commandType: CommandType.StoredProcedure);

                dynamic idEntity = entity;
                idEntity.Id = (int)Id;
                return idEntity;
            }
        }

        public async Task DeleteAsync(int id)
        {
            var storeProc = $"dbo.{_genericTypeName}_Delete";

            using (var conn = _dbConnectionFactory.CreateConnection())
            {
                var p = new DynamicParameters();
                p.Add("@id", id);
                await conn.ExecuteAsync(storeProc, p, commandType: CommandType.StoredProcedure);
            }

        }

        public async Task<TEntity> GetByIdAsync(int id)
        {
            var storeProc = $"dbo.{_genericTypeName}_Get";

            using (var conn = _dbConnectionFactory.CreateConnection())
            {
                var p = new DynamicParameters();
                p.Add("@Id", id);
                return await conn.QueryFirstOrDefaultAsync<TEntity>(storeProc, p, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<IEnumerable<TEntity>> ListAllAsync()
        {
            var storeProc = $"dbo.{_genericTypeName}_GetAll";

            using (var conn = _dbConnectionFactory.CreateConnection())
            {
                return await conn.QueryAsync<TEntity>(storeProc,  commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<IEnumerable<TEntity>> ListAsync(string criteriaName, DynamicParameters parameters)
        {
            var storeProc = $"dbo.{_genericTypeName}_{criteriaName}";
            using (var conn = _dbConnectionFactory.CreateConnection())
            {
                return await conn.QueryAsync<TEntity>(storeProc, parameters, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task UpdateAsync(TEntity entity)
        {
            var storeProc = $"dbo.{_genericTypeName}_Update";
            using (var conn = _dbConnectionFactory.CreateConnection())
            {
                DynamicParameters parameters = Mapping(entity, false);
                var Id = await conn.ExecuteScalarAsync(storeProc, parameters, commandType: CommandType.StoredProcedure);

                await conn.ExecuteAsync(storeProc, parameters, commandType: CommandType.StoredProcedure);
            }
        }

        internal virtual DynamicParameters Mapping(TEntity entity, bool ignoreId)
        {
            var parameters = new DynamicParameters();
            foreach (var property in entity.GetType().GetProperties())
            {
                if (IsSimpleProperty(property.PropertyType) || property.PropertyType.IsEnum)
                {
                    if (ignoreId && property.Name.ToLower() == "id") continue;
                    parameters.Add($"@{property.Name}", property.GetValue(entity));
                }
            }

            return parameters;
        }

        private static bool IsSimpleProperty(Type t)
        {
            return new[] {
                typeof(string),
                typeof(char),
                typeof(byte),
                typeof(sbyte),
                typeof(ushort),
                typeof(short),
                typeof(uint),
                typeof(int),
                typeof(ulong),
                typeof(long),
                typeof(float),
                typeof(double),
                typeof(decimal),
                typeof(DateTime)

            }.Contains(t);
        }


        internal virtual dynamic Mapping(TEntity item)
        {
            return item;
        }
    }
}
