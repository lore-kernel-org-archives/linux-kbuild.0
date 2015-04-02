Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:35615 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752522AbbDBM3D (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Apr 2015 08:29:03 -0400
Received: by widdi4 with SMTP id di4so76984456wid.0
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2015 05:29:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87bnj63es2.fsf@lebrac.rtp-net.org>
References: <cover.1427968988.git.riku.voipio@linaro.org>
	<f5cc7f6394efe3d5404beb5588b67671dca9fb74.1427968988.git.riku.voipio@linaro.org>
	<87k2xu3frr.fsf@lebrac.rtp-net.org>
	<87bnj63es2.fsf@lebrac.rtp-net.org>
Date: Thu, 2 Apr 2015 15:29:02 +0300
Message-ID: <CAAqcGHnmxF5iYCT3RDL32-A6Xnqt5k8awPn6-iUUQ0a54jwQbQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] builddeb: install dtbs
From: Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Patard <arnaud.patard@rtp-net.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, mmarek <mmarek@suse.cz>, debian-kernel <debian-kernel@lists.debian.org>

On 2 April 2015 at 15:17, Arnaud Patard <arnaud.patard@rtp-net.org> wrote:
> Arnaud Patard (Rtp) <arnaud.patard@rtp-net.org> writes:
>> Already sent a "better" patch for that (your patch is not handling
>> system with CONFIG_OF and without dtbs_install):
>> http://www.spinics.net/lists/linux-kbuild/msg10794.html

> Oops. Wrong version. The right one is v4:
> http://www.spinics.net/lists/linux-kbuild/msg10832.html

Your version looks good. What needs to happen for it to get merged?

Riku
