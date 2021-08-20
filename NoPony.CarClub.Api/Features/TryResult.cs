namespace NoPony.CarClub.Api.Features
{
    public class TryResult<T>
    {
        private readonly bool _outcome;
        public bool Outcome => _outcome;

        private readonly T _data;
        public T Result => _data;

        public TryResult(bool outcome, T data)
        {
            _outcome = outcome;
            _data = data;
        }
    }
}
