using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Carfinance.Poolleague.Api.Controllers.v1
{
    public class Elo
    {
        const double kFactor = 32; //Factor to stop big swings in ranking.
        public class Player
        {
            public int id { get; set; }
            public int rating { get; set; }
        }
        public class MatchUp
        {
            public Player winner { get; set; }
            public Player loser { get; set; }
        }
        public class NewRating
        {
            double winnerRating { get; set; }
            double loserRating { get; set; }
            public NewRating(double winnerRating, double loserRating)
            {
                this.winnerRating = winnerRating;
                this.loserRating = loserRating;
            }
        }
        public static double WinProbability(Player a, Player b)
        {
            return 1 / (1 + Math.Pow(10, (b.rating - a.rating) / 400));
        }
        public static int WinnerRating(Player winner, Player loser)
        {
            return (int)(winner.rating + kFactor * (1 - WinProbability(winner, loser)));
        }
        public static int LoserRating(Player winner, Player loser)
        {
            return (int)(loser.rating + kFactor * (-WinProbability(loser, winner)));
        }
        public static NewRating CalcRankingFromMatch(MatchUp match)
        {
            return new NewRating(
                WinnerRating(match.winner, match.loser),
                LoserRating(match.winner, match.loser));
        }
    }
}
