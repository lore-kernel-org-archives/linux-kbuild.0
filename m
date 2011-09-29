Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relay4.ptmail.sapo.pt ([212.55.154.24]:52450 "HELO sapo.pt"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with SMTP
	id S1757014Ab1I2TQq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Sep 2011 15:16:46 -0400
Received: from unknown (HELO serjux.com) (sergiomb@sapo.pt@[188.83.4.143])
          (envelope-sender <sergio@serjux.com>)
          by mta12 (qmail-ptmail-1.0.0) with AES256-SHA encrypted SMTP
          for <linux-kbuild@vger.kernel.org>; 29 Sep 2011 19:16:44 -0000
Subject: kBuild-0.1.9998
From: =?ISO-8859-1?Q?S=E9rgio?= Basto <sergio@serjux.com>
Date: Thu, 29 Sep 2011 20:16:42 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1317323802.13830.12.camel@segulix>
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

Sorry I missed a few words. 
I need update kBuild for compile VirtualBox 4.1.2



I do this:
svn co http://svn.netlabs.org/repos/kbuild/trunk/
mv trunk kBuild-0.1.9998
tar cvzf kBuild-0.1.9998.tar.gz kBuild-0.1.9998/ --exclude=.svn

this is the right way ? 

Any way http://kbuild.sourceforge.net/ is completely out-of-date 
The link of "The CML2 Resources Page" http://tuxedo.org/~esr/cml2/ is broken 
I found a note on  http://sourceforge.net/projects/kbuild/

so the latest source is in 
http://svn.netlabs.org/kbuild ? 

and for when we have a new release ? (will be easier packing into Fedora distro)

Thanks, 

-- 
Sérgio M. B.


--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


