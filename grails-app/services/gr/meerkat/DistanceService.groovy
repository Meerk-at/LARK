package gr.meerkat

import grails.transaction.Transactional

@Transactional
class DistanceService {

    def distanceLatLong(Location center,Location point) {
        double R = 6371000; // metres
        double phi1 = Math.toRadians(center.latitude);
        double phi2 = Math.toRadians(point.latitude);
        double dphi = Math.toRadians(point.latitude-center.latitude);
        double dl = Math.toRadians(point.longitude-center.longitude);

        double a = Math.sin(dphi/2) * Math.sin(dphi/2) +
                Math.cos(phi1) * Math.cos(phi2) *
                Math.sin(dl/2) * Math.sin(dl/2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));

        return R * c;
    }

    def tspBF(double[][] distance_table,double best,int[] bpath,int[] path,int level,double costSoFar){
        def n = distance_table[0].length
        def newCost
        if (level == n-1){
//            newCost = costSoFar + distance_table[path[n-1]][path[0]]

            if (best > costSoFar){
                best = costSoFar;
                bpath = path
            }
        }else{
            for (int k = level+1 ; k < n ; k++){
                newCost = costSoFar + distance_table[path[level]][path[k]]
                if (newCost < best){
                    int[] newpath = new int[path.size()]
                    for (int i = 0 ; i <= level ; i++){
                        newpath[i] = path[i]
                    }
                    newpath[level+1] = path[k];
                    for (int i = level+2 ; i <= k ; i++){
                        newpath[i] = path[i-1]
                    }
                    for (int i = k+1 ; i <= n-1 ; i++){
                        newpath[i] = path[i]
                    }

                    (best,bpath) = tspBF(distance_table,best,bpath,newpath,level+1,newCost)
                }
            }
        }

        return [best,bpath]

    }
}
