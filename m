Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:41010 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751833Ab1GBBrs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 1 Jul 2011 21:47:48 -0400
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFC 0/7] Kconfig library check merge
Date: Fri,  1 Jul 2011 21:47:32 -0400
Message-Id: <1309571259-15241-1-git-send-email-lacombar@gmail.com>
In-Reply-To: <1307387767-9237-1-git-send-email-lacombar@gmail.com>
References: <1307387767-9237-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>
Cc: Arnaud Lacombe <lacombar@gmail.com>

Hi Michal,

You'll find hereafter a splitted-down version of my previous preliminary
patch. I will eventually need to complete the second commit message, it is
missing the purpose of the change, which AFAIR was a failure of something.

Comments welcome!

 - Arnaud

Arnaud Lacombe (7):
  kconfig/Makefile: add pretty printer for moc(1)
  kconfig/Makefile: ensure `conf' appears last in `hostprogs-y'
  kconfig/check.sh: prepare for generic check
  kconfig: move QT checks to `scripts/kconfig/check.sh'
  kconfig: move GTK checks to `scripts/kconfig/check.sh'
  kconfig: move ncurses checks to `scripts/kconfig/check.sh'
  kconfig: add stub for nconf checks

 scripts/kconfig/Makefile                   |  155 +++++-----------------
 scripts/kconfig/check.sh                   |  199 ++++++++++++++++++++++++++--
 scripts/kconfig/lxdialog/check-lxdialog.sh |   84 ------------
 3 files changed, 223 insertions(+), 215 deletions(-)

-- 
1.7.3.4.574.g608b.dirty

