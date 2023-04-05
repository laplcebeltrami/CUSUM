function CUSUM_display(y,pos, neg)
 %Display the positive-CUSUM and negative-cusum. 

 figure;
 plot(y, 'k');
 title('CUSUM');
 %ylim([-50 50])
 hold on; plot(pos, 'r')
 hold on; plot(neg, 'b')


 set(gca, 'Fontsize',16);
 whitebg(gcf,'w');
 set(gcf,'Color','w','InvertHardcopy','off');

