Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.emea.novell.com ([130.57.118.101]:43723 "EHLO
	mail.emea.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751141AbaKDJFO convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:2:1>);
	Tue, 4 Nov 2014 04:05:14 -0500
Message-Id: <5458A4D60200007800044ABE@mail.emea.novell.com>
Date: Tue, 04 Nov 2014 09:05:10 +0000
From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 0/2] kconfig: enhance parsing and operator recognition
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yann.morin.1998@free.fr

There being at least one case (DEBUG_UART_8250_WORD in
arch/arm/Kconfig.debug) where the utility silently behaves other than
what the programmer expects tells us that (a) we shouldn't silently
ignore unrecognized characters and (b) it's not just me always having
wanted to be able to use comparisons other than (in)equality ones.

1: don't silently ignore unhandled characters
2: allow use of relations other than (in)equality

Signed-off-by: Jan Beulich <jbeulich@suse.com>

