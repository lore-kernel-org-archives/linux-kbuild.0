Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.gmx.net ([213.165.64.20]:43203 "HELO mail.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1754102AbYGSMXp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 19 Jul 2008 08:23:45 -0400
From: Marvin <marvin24@gmx.de>
Subject: comparision of int values
Date: Sat, 19 Jul 2008 14:23:41 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200807191423.41571.marvin24@gmx.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

is there a way to compare int values?

E.g.:

config FOO
	int
	prompt "Foo"
	range 1 10

config BAR
	def_bool (FOO || 5) = 5

for bool BAR = ( FOO <= 5 )?

Thanks

Marvin
