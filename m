Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nd215.dnsexit.com ([64.182.102.215]:39465 "EHLO
	box7.911domain.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S932091Ab1DZVo0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2011 17:44:26 -0400
Message-ID: <4DB73C8C.90705@verizon.net>
Date: Tue, 26 Apr 2011 17:43:40 -0400
From: Peter Foley <pefoley2@verizon.net>
Reply-To: <pefoley2@verizon.net>
MIME-Version: 1.0
Subject: [PATCH 0/4] kbuild: Makefile cleanups
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

This patch series adds some targets to PHONY and makes some targets work
in KBUILD_OUTDIR.
Please discard my previous patches:
"allow headerdep to work in KBUILD_OUTPUT and add targets to PHONY"
and "allow includecheck and versioncheck to work in KBUILD_OUTPUT"

Thanks,

Peter
