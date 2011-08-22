Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:55248 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754189Ab1HVIm4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Aug 2011 04:42:56 -0400
Message-ID: <4E521688.1000701@redhat.com>
Date: Mon, 22 Aug 2011 16:42:48 +0800
From: Cong Wang <amwang@redhat.com>
MIME-Version: 1.0
Subject: Re: [RFC] Kbuild: allow code re-use across different directories
References: <1313800642-32418-1-git-send-email-lacombar@gmail.com>
In-Reply-To: <1313800642-32418-1-git-send-email-lacombar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

于 2011年08月20日 08:37, Arnaud Lacombe 写道:
> Hi folks,
>
> The attached patch modify Kbuild to allow to directly re-use code in multiple
> directory without having to go through a copy. Technically, it changes Kbuild to
> use by default the VPATH feature of GNU make and provides accessors for Makefile
> to change it indirectly.
...
>
> With the attached patch, we would do:
>
> arch/foo/boot/Makefile:
> LDFLAGS_fancy.o := -DPANTS=30
> obj-y += fancy.o
> vpath-y += $(srctree)/arch/foo/lib
>
> and let GNU make do the job.

Just note that don't forget to update Documentation/kbuild/makefiles.txt. ;)

Thanks.
