Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:41413 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757317Ab3DZT2e (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 26 Apr 2013 15:28:34 -0400
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com ([174.115.5.73]:41109 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1UVnxB-0004iS-IK
	for linux-kbuild@vger.kernel.org; Fri, 26 Apr 2013 15:05:05 -0400
Date: Fri, 26 Apr 2013 15:05:02 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: strange behaviour from "make localmodconfig" throws out ath9k
 stuff
Message-ID: <alpine.DEB.2.02.1304261459030.17575@oneiric>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>


  probably a simple explanation for this, but my first time playing
with "make localmodconfig" and it appears to be tossing all my
ath9k-related module settings.

  currently running ubuntu on a 64-bit asus laptop with the following
ath9k-related modules:

$ lsmod | grep ath9k
ath9k                 149545  0
mac80211              558577  1 ath9k
ath9k_common           14054  1 ath9k
ath9k_hw              408874  2 ath9k,ath9k_common
ath                    23828  3 ath9k,ath9k_common,ath9k_hw
cfg80211              211955  3 ath9k,mac80211,ath
$

  starting with current kernel "git pull", i do:

$ make allmodconfig

at which point i get:

$ grep ATH9K .config
CONFIG_ATH9K_HW=m
CONFIG_ATH9K_COMMON=m
CONFIG_ATH9K_DFS_DEBUGFS=y
CONFIG_ATH9K_BTCOEX_SUPPORT=y
CONFIG_ATH9K=m
CONFIG_ATH9K_PCI=y
CONFIG_ATH9K_AHB=y
CONFIG_ATH9K_DEBUGFS=y
CONFIG_ATH9K_DFS_CERTIFIED=y
CONFIG_ATH9K_MAC_DEBUG=y
CONFIG_ATH9K_RATE_CONTROL=y
CONFIG_ATH9K_HTC=m
CONFIG_ATH9K_HTC_DEBUGFS=y
$

which looks reasonable(?).  then run:

$ make localmodconfig

have to answer maybe 4 questions manually, at which point i have:

$ grep ATH9K .config
$

that doesn't look good, i should definitely have module selections for
ath9k stuff, no?  and if i run that command again, i get:

$ make localmodconfig
using config: '.config'
WARNING: ATH9K_HW is required, but nothing in the
  current config selects it.
WARNING: ATH_COMMON is required, but nothing in the
  current config selects it.
WARNING: ATH9K_COMMON is required, but nothing in the
  current config selects it.
module ath9k did not have configs CONFIG_ATH9K
module uas did not have configs CONFIG_USB_UAS
module ath did not have configs CONFIG_ATH_COMMON
module ath9k_hw did not have configs CONFIG_ATH9K_HW
module ath9k_common did not have configs CONFIG_ATH9K_COMMON
#
# configuration written to .config
#
$

so there seems to be something related specifically to ath9k that
doesn't play well with "localmodconfig". or am i doing something
silly?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
