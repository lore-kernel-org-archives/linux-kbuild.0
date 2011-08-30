Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:64444 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751384Ab1H3Arn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Aug 2011 20:47:43 -0400
Received: by pzk37 with SMTP id 37so9357403pzk.1
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Aug 2011 17:47:43 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 29 Aug 2011 20:47:43 -0400
Message-ID: <CACqU3MUEqL1=s29+ibH3CvVCvm8VDN4RM-8bd+dWxdmeF-d4gw@mail.gmail.com>
Subject: Pending kconfig patches
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Hi,

FYI, I've been picking a few patches on the list which have not yet
reached your kbuild-2.6/kconfig branch. They are available in the git
repository at:

git://github.com/lacombar/linux-2.6.git kconfig/for-next

and it currently contains:

Arnaud Lacombe (1):
      kconfig: fix __enabled_ macros definition for invisible and
un-selected symbols

Davidlohr Bueso (1):
      kconfig: handle SIGINT in menuconfig

Lucas De Marchi (1):
      kconfig: fix set but not used variables

 scripts/kconfig/confdata.c         |   49 +++++++++++++++-----
 scripts/kconfig/lxdialog/textbox.c |    3 +-
 scripts/kconfig/mconf.c            |   86 ++++++++++++++++++++++--------------
 3 files changed, 89 insertions(+), 49 deletions(-)

Regards,
 - Arnaud
