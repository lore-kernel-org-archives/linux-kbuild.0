Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:42143 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965403AbcKDSjv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Nov 2016 14:39:51 -0400
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: -fno-PIE, take #3
Date: Fri,  4 Nov 2016 19:39:37 +0100
Message-Id: <20161104183940.30692-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, x86@kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Ben Hutchings <ben@decadent.org.uk>, Sven Joachim <svenjoac@gmx.de>, "Austin S. Hemmelgarn" <ahferroin7@gmail.com>, Borislav Petkov <bp@alien8.de>

Debian gcc's is nowdays compiled with --enable-default-pie which means it d=
oes
-fPIE by default. This breaks atleast x86-64 compiles.
This is the third attempt to fix it, this time by using runtime detection of
the -fno-PIE compiler switch (it was introduced in gcc 3.4, min required gc=
c is
currently 3.2) so it can be backported to the stable kernels.
As noted by Al this won't fix `git bisect' of stable kernels prio this comm=
it.
However using always a wrapper around gcc which adds -fno-PIE is not sollut=
ion
I want to rely in future.

Sebastian
