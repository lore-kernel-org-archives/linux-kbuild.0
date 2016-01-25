Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:39674 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757374AbcAYQZP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 25 Jan 2016 11:25:15 -0500
Subject: Re: Dependency issue through subdir's
References: <56A6080C.2070006@kbingham.co.uk> <56A62187.3070805@suse.com>
 <56A64BE2.9030105@kbingham.co.uk>
From: Michal Marek <mmarek@suse.com>
Message-ID: <56A64C69.7090000@suse.com>
Date: Mon, 25 Jan 2016 17:25:13 +0100
MIME-Version: 1.0
In-Reply-To: <56A64BE2.9030105@kbingham.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kieran Bingham <kieran@kbingham.co.uk>
Cc: linux-kbuild@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>, Lee Jones <lee.jones@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On 2016-01-25 17:22, Kieran Bingham wrote:
> I've got a working patch now for the $(MAKE) version,
> however I've had to use $(build)=scripts/gdb/linux build_constants to
> make it work.

$(build)= is the correct syntax, sorry for the confusion.

Michal

