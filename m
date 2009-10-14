Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f176.google.com ([209.85.211.176]:39886 "EHLO
	mail-yw0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751512AbZJNGi1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 14 Oct 2009 02:38:27 -0400
Received: by ywh6 with SMTP id 6so9735962ywh.4
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Oct 2009 23:37:50 -0700 (PDT)
Date: Wed, 14 Oct 2009 01:46:23 -0500
From: Jonathan Nieder <jrnieder@gmail.com>
Subject: [PATCH resend 0/2] fakeroot dwimery for scripts/package/*
Message-ID: <20091014064622.GA8711@progeny.tock>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, maximilian attems <max@stro.at>, Frans Pop <elendil@planet.nl>

Without these patches, to build an upgraded kernel on a Debian machine,
one has to use commands I keep on forgetting:

	make oldconfig
	make
	fakeroot -u make deb-pkg

With these patches applied, as long as fakeroot is installed, a single
command will do:

	make oldconfig deb-pkg

If fakeroot is not installed, there should be no change in behavior.
I have been using this to build the last few kernels, finding it very
convenient.

I look forward to your thoughts, even if they are just "I have no time
to look at this now".  I would like to get an idea of whether people
think these patches are a good idea, so I can fix them if they're
broken and chase them out of my local tree.

Jonathan Nieder (2):
  scripts/package: add ROOTCMD variable
  scripts/package: use fakeroot if available

 scripts/package/Makefile |   22 ++++++++++++++++------
 1 files changed, 16 insertions(+), 6 deletions(-)

