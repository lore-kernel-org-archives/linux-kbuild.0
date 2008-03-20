Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mxout.vub.ac.be ([134.184.129.111]:52717 "EHLO mxout.vub.ac.be"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755320AbYCTOTo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Mar 2008 10:19:44 -0400
Received: from Macintosh.ugent.be (boromir.ugent.be [157.193.92.81])
	by prog2.vub.ac.be (Postfix) with ESMTP id F01A281B26E
	for <linux-kbuild@vger.kernel.org>; Thu, 20 Mar 2008 15:16:58 +0100 (CET)
Message-Id: <9048849A-9578-40E7-BD0E-FF2CD34F9372@ugent.be>
From: Bram Adams <Bram.Adams@ugent.be>
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v919.2)
Subject: The evolution of the Linux kernel build system
Date: Thu, 20 Mar 2008 15:19:39 +0100
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

My name is Bram Adams and I'm a PhD student at Ghent University in  
Belgium. Part of the research of our lab is about understanding build  
systems to investigate the close (co-)evolution of source code and the  
build system. For this, we have examined the evolution of the (major  
releases of the) Linux kernel build system from 1991 to 2007. A first  
report of this work has been published online at http://eceasst.cs.tu-berlin.de/index.php/eceasst/article/view/115 
, and Sam Ravnborg encouraged us to share this with the kbuild mailing  
list. A more detailed report is expected to be available in two or  
three months.

Our paper looks at the evolution of the Linux kernel build system  
(1991-2007) from various angles:
  * measurement of the number of lines of source code, build and  
configuration scripts
  * measurements of the complexity of the build dependency graph
  * visualisation of the build dependency graph
  * filtering of the build dependency graph to uncover build idioms
  * the kbuild documentation
  * mailing list discussions
  * notes on web sites
  * and of course the makefiles and configuration scripts themselves  
when in doubt about something

We have used this data to find measurable evidence of the evolution of  
the internal complexity of the build layer (kbuild). We did not  
investigate in detail the "user interface" of makefiles and  
configuration scripts, i.e. how developers add new modules or kernel  
source files. Further investigation is needed on this. We are planning  
to analyse other systems besides the Linux kernel to generalise our  
findings and to examine whether predictions could be made on the  
health or evolvability of a build system based on the above  
characteristics.

We would like to thank Sam Ravnborg and Kai Germaschewski for their  
constructive comments on an earlier version of the report. Any  
feedback on the published report or suggestions for further analysis  
are gladly appreciated.

Kind regards,

Bram Adams
GH-SEL, INTEC, Ghent University (Belgium)
http://users.ugent.be/~badams/
