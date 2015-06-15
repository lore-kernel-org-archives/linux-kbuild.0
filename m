Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.emea.novell.com ([130.57.118.101]:38497 "EHLO
	mail.emea.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753243AbbFOL7R convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:3:1>);
	Mon, 15 Jun 2015 07:59:17 -0400
Message-Id: <557EDA310200007800084C43@mail.emea.novell.com>
Date: Mon, 15 Jun 2015 12:59:13 +0100
From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 0/2] kconfig: allow use of relations other than
 (in)equality
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: pebolle@tiscali.nl, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

1: allow use of relations other than (in)equality
2: re-generate *.c_shipped files after previous change

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Note that while benign for the first patch, the second patch can only
be applied cleanly on top of "kconfig: don't silently ignore unhandled
characters" (commit 2e0d737fc7 in kbuild.git).

