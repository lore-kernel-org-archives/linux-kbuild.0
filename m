Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:42849 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757032Ab3EGPrj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 May 2013 11:47:39 -0400
Received: by mail-wg0-f52.google.com with SMTP id k13so760636wgh.31
        for <linux-kbuild@vger.kernel.org>; Tue, 07 May 2013 08:47:37 -0700 (PDT)
From: Anisse Astier <anisse@astier.eu>
Subject: [PATCH v4 0/4] deb-pkg: bring it a little bit closer to debian packaging
Date: Tue,  7 May 2013 17:46:47 +0200
Message-Id: <1367941611-12223-1-git-send-email-anisse@astier.eu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>, Anisse Astier <anisse@astier.eu>, Ben Hutchings <bhutchings@solarflare.com>, debian-kernel@lists.debian.org, kernel-team@lists.ubuntu.com

These little fixes should bring debian packaging closer to the way it's done in debian:


Changes since:
v2:
 - only build debug packages when CONFIG_DEBUG_INFO=y
 - build debug package last.
 - more verbose debug package description
 - put package in section debug
v3:
 - remove duplicate code from v2
v4:
 - fixes thanks to Ben Hutchings' review
 - use KCONFIG_CONFIG instead of .config
 - use installed path specific to each architecture instead of hard-coded
   /boot/vmlinuz-$version, based on
   http://anonscm.debian.org/viewvc/kernel/dists/wheezy/linux/debian/rules.real?view=markup

Anisse Astier (4):
  deb-pkg: use KCONFIG_CONFIG instead of .config file directly
  deb-pkg: split debug symbols in their own package
  deb-pkg: fix installed image path on parisc, mips and powerpc
  deb-pkg: add a hook argument to match debian hooks parameters

 scripts/package/builddeb | 82 +++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 67 insertions(+), 15 deletions(-)

-- 
1.8.3.rc1

