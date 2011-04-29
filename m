Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nd215.dnsexit.com ([64.182.102.215]:51336 "EHLO
	box7.911domain.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751944Ab1D2Wi6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Apr 2011 18:38:58 -0400
Message-ID: <4DBB3DD4.9000000@verizon.net>
Date: Fri, 29 Apr 2011 18:38:12 -0400
From: Peter Foley <pefoley2@verizon.net>
Reply-To: <pefoley2@verizon.net>
MIME-Version: 1.0
Subject: [PATCH V2 0/7] kbuild: move scripts/basic/docproc.c to scripts/docproc.c
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

This patchset moves scripts/basic/docproc to scripts/docproc.
This causes docproc to only be built for *doc targets rather than every
time the kernel is compiled.

Patches also attached as requested by Michal Marek.

Thanks,

Peter
