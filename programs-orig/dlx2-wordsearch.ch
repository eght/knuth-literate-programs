@x
  if (spacing && (count mod spacing==0)) {
    printf(""O"lld:\n",count);
    for (k=0;k<=level;k++) print_row(choice[k],stdout);
    fflush(stdout);
  }
@y [this was hacked from dlx2-polyom.ch in the obvious way]
  if (spacing && (count mod spacing==0)) {
    register cc,d,l,t,x,y;
    for (k=0;k<=level;k++) {
      for (r=choice[k]+1;;) {
        cc=nd[r].col;
        if (cc<=0) {
          r=nd[r].up;@+continue;
        }
        if (nd[r].color) {
          x=cl[cc].name[0],y=cl[cc].name[1];
          if (x>='0' && x<='9') x=x-'0';
          else if (x>='a' && x<='z') x=x-'a'+10;
          else if (x>='A' && x<='Z') x=x-'A'+36;
          else panic("Bad x coordinate");
          if (y>='0' && y<='9') y=y-'0';
          else if (y>='a' && y<='z') y=y-'a'+10;
          else if (y>='A' && y<='Z') y=y-'A'+36;
          else panic("Bad y coordinate");
          if (x>xmax) xmax=x;
          if (y>ymax) ymax=y;
          if (x<xmin) xmin=x;
          if (y<ymin) ymin=y;
          box[x+1][y+1]=(nd[r].color>0?nd[r].color:nd[cc].color);
        }
        if (r==choice[k]) break;
        r++;
      }
    }
    for (x=xmin;x<=xmax;x++) {
      if (x>xmin) printf("|");
      for (y=ymin;y<=ymax;y++) {
        printf(""O"c",box[x+1][y+1]?box[x+1][y+1]:'.');
      }
    }
    printf(" #"O"lld\n",count);
    fflush(stdout);
    for (x=xmin;x<=xmax;x++) 
     for (y=ymin;y<=ymax;y++)
       box[x+1][y+1]=0;
  }
@z
@x
@*Index.
@y
@ @<Glob...@>=
char box[64][64]; /* allow space for margins in all three coordinates */
int xmax,ymax;
int xmin=64,ymin=64;

@*Index.
@z
