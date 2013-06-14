Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f181.google.com ([74.125.82.181]:48407 "EHLO
	mail-we0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751268Ab3FNJrL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Jun 2013 05:47:11 -0400
Received: by mail-we0-f181.google.com with SMTP id p58so293257wes.40
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Jun 2013 02:47:10 -0700 (PDT)
From: Anisse Astier <anisse@astier.eu>
Subject: [PATCH v5 0/4] deb-pkg: bring it a little closer to debian packaging
Date: Fri, 14 Jun 2013 11:46:53 +0200
Message-Id: <1371203217-19572-1-git-send-email-anisse@astier.eu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: debian-kernel@lists.debian.org, kernel-team@lists.ubuntu.com, Ben Hutchings <ben@decadent.org.uk>, Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>, Anisse Astier <anisse@astier.eu>

These little fixes should bring debian packaging closer to the way it's done in debian.

Changes in:
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
v5:
 - fixes thanks to Ben Hutchings' review
 - don't use $objtree as it's redundant in build scripts
 - add symbolic links to vmlinux to work with other tools than perf
 - pick-up reviewed-by from ml for patch 3 and 4


Anisse Astier (4):
  deb-pkg: use KCONFIG_CONFIG instead of .config file directly
  deb-pkg: split debug symbols in their own package
  deb-pkg: fix installed image path on parisc, mips and powerpc
  deb-pkg: add a hook argument to match debian hooks parameters

 scripts/package/builddeb | 91 ++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 76 insertions(+), 15 deletions(-)

-- 
1.8.3.rc1

