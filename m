Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43394 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbfBSV4A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Feb 2019 16:56:00 -0500
Received: by mail-pf1-f195.google.com with SMTP id q17so10837821pfh.10
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Feb 2019 13:55:59 -0800 (PST)
Date: Tue, 19 Feb 2019 13:55:58 -0800 (PST)
Subject: Re: [PATCH 02/11] riscv: remove the HAVE_KPROBES option
In-Reply-To: <20190219151759.GD4121@lst.de>
From: Palmer Dabbelt <palmer@sifive.com>
Message-ID: <mhng-a73ea6c9-683c-4ee0-991e-24a6608b6887@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: yamada.masahiro@socionext.com, Christoph Hellwig <hch@lst.de>, linux-xtensa@linux-xtensa.org, linux-s390@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org

On Tue, 19 Feb 2019 07:17:59 PST (-0800), Christoph Hellwig wrote:
> On Fri, Feb 15, 2019 at 06:32:07PM +0900, Masahiro Yamada wrote:
>> On Thu, Feb 14, 2019 at 2:40 AM Christoph Hellwig <hch@lst.de> wrote:
>> >
>> > HAVE_KPROBES is defined genericly in arch/Kconfig and architectures
>> > should just select it if supported.
>> >
>> > Signed-off-by: Christoph Hellwig <hch@lst.de>
>>
>> Do you want this patch picked up by me?
>>
>> Or, by Palmer?
>
> Given that I don't think I'll have the rest of this series respun in time
> for this merge window:  Palmer, can you pick it up?

It's on my for-next.
