Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-px0-f180.google.com ([209.85.216.180]:49579 "EHLO
	mail-px0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933201AbZKXO5T (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Nov 2009 09:57:19 -0500
Received: by pxi10 with SMTP id 10so4976085pxi.33
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Nov 2009 06:57:25 -0800 (PST)
Date: Tue, 24 Nov 2009 09:09:05 -0600
From: Jonathan Nieder <jrnieder@gmail.com>
Subject: [PATCH v3 0/3] fakeroot dwimery for deb-pkg target
Message-ID: <20091124150904.GA14731@progeny.tock>
References: <20091014064622.GA8711@progeny.tock>
 <20091014071627.GA6256@merkur.ravnborg.org>
 <200910141159.03799.elendil@planet.nl>
 <20091014110331.GZ28231@baikonur.stro.at>
 <20091015133139.GA6718@progeny.tock>
 <20091015133532.GB6718@progeny.tock>
 <4B0BC306.9010009@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4B0BC306.9010009@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, maximilian attems <max@stro.at>, Sam Ravnborg <sam@ravnborg.org>, Frans Pop <elendil@planet.nl>

Hi,

As Michal noticed, the tar*-pkg and *rpm-pkg targets can work fine
without being able to write files owned by root.  Only deb-pkg needs
to learn to acquire faked root privileges.  Here is an updated series
reflecting this.

This version no longer documents the KBUILD_PKG_ROOTCMD variable in
"make help" output.  If make already has root privileges or fakeroot
is installed, then the target will just work without any need for the
user to worry about this.  If not, instead of waiting from an error
from chmod, it seemed better to give an error right away with advice
to set KBUILD_PKG_ROOTCMD appropriately.

Since the scope of the variable’s applicability somewhat, I have not
carried over any acks.  But I am hoping you will still like the
patches. :)

Jonathan Nieder (2):
  scripts/package: add KBUILD_PKG_ROOTCMD variable
  scripts/package: deb-pkg: use fakeroot if available

Michal Marek (1):
  scripts/package: tar-pkg: use tar --owner=root

 scripts/package/Makefile |   20 +++++++++++++++++++-
 scripts/package/buildtar |    6 +++++-
 2 files changed, 24 insertions(+), 2 deletions(-)
