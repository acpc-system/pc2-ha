resource "pc2data" {
                        device minor 1;
                        disk "/dev/pc2datavg/pc2datalv";
                        meta-disk internal;

                        on "pc2master" {
                                Inode-id 0;
                        }
                        on "pc2slave" {
                                node-id 1;
                        }
			
                        connection {
                                host "pc2master" address drbdm:7789;
                                host "pc2slave" address drbds:7789;
				
                        }
                }
