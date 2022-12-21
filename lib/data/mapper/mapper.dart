abstract class Mapper<N, M> {
  M map(N item);
  N reverse(M item);
}