function [D]=density_scatter(A,B,R,dotsize)
      %% A and B are columns vectors, R is the radious for count dots since current dot
      if nargin<3
          R=10;
          dotsize=20;
      else if nargin<4
              dotsize=20;
          end
      end
      AB=[A B];
      distmat=squareform(pdist(AB));
      C=sum(distmat<=R,2);
      D=max(C);
      scatter(A,B,dotsize,C,'filled');
      %some configuration
      colormap('jet');
      cb=colorbar();
      colormap(cb,'jet');
      set(cb,'FontSize',12);
      cb.Label.String='Counts';
      rl=refline([1,0]);
      rl.LineWidth=2;
      rl.Color='k';
      set(gca,'FontSize',16);
end
