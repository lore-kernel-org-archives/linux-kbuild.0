Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:53739 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965366AbcA1BOA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 27 Jan 2016 20:14:00 -0500
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id BC11020265
	for <linux-kbuild@vger.kernel.org>; Thu, 28 Jan 2016 01:13:59 +0000 (UTC)
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 74F3D2022D
	for <linux-kbuild@vger.kernel.org>; Thu, 28 Jan 2016 01:13:58 +0000 (UTC)
Received: by mail-yk0-f181.google.com with SMTP id a85so13807419ykb.1
        for <linux-kbuild@vger.kernel.org>; Wed, 27 Jan 2016 17:13:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <56A9377E.1090404@suse.com>
References: <E1ZoWXk-0007DX-SY@rmk-PC.arm.linux.org.uk> <20151020132002.GD3953@io.lakedaemon.net>
 <20160127201845.GI10826@n2100.arm.linux.org.uk> <56A9377E.1090404@suse.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 27 Jan 2016 19:13:38 -0600
Message-ID: <CAL_JsqLYvQS1M-3dn3kd4qpmqCxSLZ-25cBhyeCpq5Z+SCog_w@mail.gmail.com>
Subject: Re: [PATCH RESEND] dtbsinstall: don't move target directory out of
 the way
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>

On Wed, Jan 27, 2016 at 3:32 PM, Michal Marek <mmarek@suse.com> wrote:
> Dne 27.1.2016 v 21:18 Russell King - ARM Linux napsal(a):
>> So what needs to happen to get this change merged?
>
> Rob, Grant, shall I merged it to the kbuild tree or do you want to take it?

Yes, please take it.

Acked-by: Rob Herring <robh@kernel.org>

Rob
