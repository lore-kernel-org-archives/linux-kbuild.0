Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lebrac.rtp-net.org ([195.154.106.105]:34479 "EHLO
	lebrac.rtp-net.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751534AbbDBMDD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Apr 2015 08:03:03 -0400
From: Arnaud Patard (Rtp) <arnaud.patard@rtp-net.org>
Subject: Re: [PATCH 2/4] builddeb: install dtbs
References: <cover.1427968988.git.riku.voipio@linaro.org>
	<f5cc7f6394efe3d5404beb5588b67671dca9fb74.1427968988.git.riku.voipio@linaro.org>
Date: Thu, 02 Apr 2015 13:56:24 +0200
In-Reply-To: <f5cc7f6394efe3d5404beb5588b67671dca9fb74.1427968988.git.riku.voipio@linaro.org>
	(riku voipio's message of "Thu, 2 Apr 2015 14:27:28 +0300")
Message-ID: <87k2xu3frr.fsf@lebrac.rtp-net.org>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: riku.voipio@linaro.org
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.cz, debian-kernel@lists.debian.org

riku.voipio@linaro.org writes:

Hi,

> From: Riku Voipio <riku.voipio@linaro.org>
>
> When kernel is built with CONFIG_OF, install all built device
> tree files built. The installation location used is same as
> toplevel INSTALL_DTBS_PATH.

Already sent a "better" patch for that (your patch is not handling
system with CONFIG_OF and without dtbs_install):
http://www.spinics.net/lists/linux-kbuild/msg10794.html
but looks like not yet merged.

Arnaud
