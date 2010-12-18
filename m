Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:52364 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751761Ab0LRGiJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Dec 2010 01:38:09 -0500
Received: by iwn9 with SMTP id 9so1467639iwn.19
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Dec 2010 22:38:08 -0800 (PST)
MIME-Version: 1.0
Date: Sat, 18 Dec 2010 01:38:08 -0500
Message-ID: <AANLkTi=GSHBCyioFjLZBMjHi=xjeeq+b5e7o6_1zWi-T@mail.gmail.com>
Subject: Unmet dependency warning duplication
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Michal Marek <mmarek@suse.cz>

Hi,

Just for the record, I believe that the current location where the
"select unmet dependency" warning is triggered, that is in
sym_calc_value(), is a bad choice. It leads to a `silentoldconfig' to
output the warning twice:

% gmake silentoldconfig
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf --silentoldconfig Kconfig
warning: (OLPC && X86_32) selects OLPC_OPENFIRMWARE which has unmet
direct dependencies (X86_32 && !X86_64 && !X86_PAE)

warning: (OLPC && X86_32) selects OLPC_OPENFIRMWARE which has unmet
direct dependencies (X86_32 && !X86_64 && !X86_PAE)

and I somehow remember that it also causes junk to be displayed when
mconf's UI is being displayed.

I'll try to come back with a patch later on.

 - Arnaud
