Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fed1rmmtao107.cox.net ([68.230.241.39]:62246 "EHLO
	fed1rmmtao107.cox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751662AbZIHX6F (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 Sep 2009 19:58:05 -0400
Received: from fed1rmimpo01.cox.net ([70.169.32.71])
          by fed1rmmtao107.cox.net
          (InterMail vM.8.00.01.00 201-2244-105-20090324) with ESMTP
          id <20090908235806.HNBW21470.fed1rmmtao107.cox.net@fed1rmimpo01.cox.net>
          for <linux-kbuild@vger.kernel.org>;
          Tue, 8 Sep 2009 19:58:06 -0400
Date: Tue, 8 Sep 2009 19:58:07 -0400 (EDT)
From: daniel.car@cox.net
Message-ID: <6174716.43962.1252454287329.JavaMail.daniel.car@127.0.0.1>
Subject: How to put output from external module in subdirectory of source
 tree
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed; delsp=no
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Does kbuild support putting the build output for an out of kernel source 
tree module in a separate directory?  For example source is src then 
object and ko files should go to src/i686.
The O=/path option is for building the kernel out of source tree, but my 
question is about building an external module and putting the build 
output elsewhere.

The modules.txt file doesn't say how to do this.  If this is not 
supported, would a patch for this functionality be welcomed?
Please cc me on replies since I'm not subscribed.

Thanks,
Daniel
