Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nd215.dnsexit.com ([64.182.102.215]:58419 "EHLO
	box7.911domain.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1758509Ab1DZWpR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2011 18:45:17 -0400
Message-ID: <4DB74AD2.9070302@verizon.net>
Date: Tue, 26 Apr 2011 18:44:34 -0400
From: Peter Foley <pefoley2@verizon.net>
Reply-To: <pefoley2@verizon.net>
MIME-Version: 1.0
Subject: [PATCH V2 0/7] kbuild: scripts/kconfig/Makefile cleanup and fixes
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

This patch set:
Changes the update-po-config target to work when make is run from KBUILD_OUTDIR.
Changes the update-po-config target to reflectg the new layout of arch/um.
Adds a check to only build kxgettext when needed.
Changes the qconf and gconf targets to change hostprogs-y when they are being built like nconf and mconf instead of defining *-objs.
Cleans up the clean-files definitions.
Silences comands unless V=1


Please discard my previous patch: "kbuild: scripts/kconfig/Makefile cleanup and fixes"

Thanks,

Peter
