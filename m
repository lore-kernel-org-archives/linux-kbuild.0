Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:15153 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751815AbbABVj1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 Jan 2015 16:39:27 -0500
Date: Fri, 2 Jan 2015 21:23:19 +0000 (UTC)
From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [RFC v3] builddeb: Try to determine distribution
In-Reply-To: <1420233405-23121-1-git-send-email-sedat.dilek@gmail.com>
Message-ID: <Pine.BSM.4.64L.1501022120500.11222@herc.mirbsd.org>
References: <1420233405-23121-1-git-send-email-sedat.dilek@gmail.com>
Content-Language: de-DE-1901, en-GB
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Ben Hutchings <ben@decadent.org.uk>, maximilian attems <max@stro.at>, Alexander Wirt <formorer@debian.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Sedat Dilek dixit:

>+# Try to determine distribution
>+codename=$(lsb_release --codename --short 2> /dev/null)
>+if [ -n "$KDEB_CHANGELOG_DIST" ]; then
>+        distribution=$KDEB_CHANGELOG_DIST
>+elif [ -n "$codename" ]; then

This is suboptimal: if KDEB_CHANGELOG_DIST is defined,
lsb_release is not necessary. The following snippet
also omits using its output if it fails but still
produces any:

if test -n "$KDEB_CHANGELOG_DIST"; then
	distribution=$KDEB_CHANGELOG_DIST
elif distribution=$(lsb_release -cs 2>/dev/null) && test -n "$distribution"; then
	:
else
	distribution=unstable
	echo "builddeb: Using default distribution of 'unstable' in the changelog"
	echo "builddeb: Set \$KDEB_CHANGELOG_DIST or install lsb-release to change this"
fi

bye,
//mirabilos
-- 
„Cool, /usr/share/doc/mksh/examples/uhr.gz ist ja ein Grund,
mksh auf jedem System zu installieren.“
	-- XTaran auf der OpenRheinRuhr, ganz begeistert
(EN: “[…]uhr.gz is a reason to install mksh on every system.”)
