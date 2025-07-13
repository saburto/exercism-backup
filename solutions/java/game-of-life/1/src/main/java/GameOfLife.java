import java.util.function.Predicate;

class GameOfLife {
    public int[][] tick(int[][] matrix){

      if (matrix.length <= 0) {
        return matrix;
      }
      
    var result = new int[matrix.length][matrix[0].length];

    for(int i = 0; i < matrix.length; i++) {
      for (int j = 0; j < matrix[0].length; j++) {

        if (matrix[i][j] == 1) {
          int liveNeighbors = haveLiveNeighbors(matrix, i, j);
          if (liveNeighbors == 2 || liveNeighbors == 3) {
            result[i][j] = 1;
          } else {
            result[i][j] = 0;
          }
        }

        if (matrix[i][j] == 0) {
          if (haveLiveNeighbors(matrix, i, j) == 3) {
            result[i][j] = 1;
          } else {
            result[i][j] = 0;
          }
        }
      }
    }



      return result;
    }

    private int haveLiveNeighbors(int[][] matrix, int i, int j) {

      int countLive = 0;

      countLive += isLive(matrix, i+1, j) ? 1 : 0;
      countLive += isLive(matrix, i-1, j) ? 1 : 0;
      countLive += isLive(matrix, i, j+1) ? 1 : 0;
      countLive += isLive(matrix, i, j-1) ? 1 : 0;

      countLive += isLive(matrix, i+1, j+1) ? 1 : 0;
      countLive += isLive(matrix, i+1, j-1) ? 1 : 0;
      countLive += isLive(matrix, i-1, j+1) ? 1 : 0;
      countLive += isLive(matrix, i-1, j-1) ? 1 : 0;


      return countLive;
    }

    private boolean isLive(int[][] matrix, int i, int j) {
      if (i < 0 || i >= matrix.length) {
        return false;
      }

      if (j < 0 || j >= matrix[0].length) {
        return false;
      }
      return matrix[i][j] == 1;
    }
}
