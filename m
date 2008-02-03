Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fmmailgate05.web.de ([217.72.192.243]:62584 "EHLO
	fmmailgate05.web.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758244AbYBCM3D (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 3 Feb 2008 07:29:03 -0500
Received: from web.de
	by fmmailgate05.web.de (Postfix) with SMTP id DF2EC3E93661
	for <linux-kbuild@vger.kernel.org>; Sun,  3 Feb 2008 13:29:00 +0100 (CET)
Date: Sun, 03 Feb 2008 13:29:00 +0100
Message-Id: <142056111@web.de>
MIME-Version: 1.0
From: devzero@web.de
Subject: defconfigs size reduction?
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

hi there, 

i found that there are a lot of deconfigs bundled with every kernel-release. (about 335 on my suse box)

summed up, that`s  6,3M and 311 KLOC (Kilo Lines of Configuration :) 

i think, that`s quite a lot.

if i strip the comments ( real comments and "# CONFIGOPT is not set") and the blank lines from that, the size reduces to 1.9M and 86 KLOC.

i have tested such stripping with arch/x86/configs/i386_defconfig and if i do a "make defconfig" afterwards, the .config in /usr/src/linux
has those comments and the blank lines again.

so it appears, that these defconfigs have lot`s of redundant information which could probably be wiped with a bigger cleanup patch.
i`m not sure, if this is a good approach, because others may use the configs in a different way or it may work differently for other arches. 

maybe you experts can give a comment here ?
would such cleanup for shrinking kernelsize be reasonable ?

regards
roland



_________________________________________________________________________
In 5 Schritten zur eigenen Homepage. Jetzt Domain sichern und gestalten! 
Nur 3,99 EUR/Monat! http://www.maildomain.web.de/?mc=021114

