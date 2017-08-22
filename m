Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f176.google.com ([209.85.128.176]:36261 "EHLO
        mail-wr0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751383AbdHVGJS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Aug 2017 02:09:18 -0400
Received: by mail-wr0-f176.google.com with SMTP id f8so79674815wrf.3
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Aug 2017 23:09:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170821155729.GC4401@obsidianresearch.com>
References: <CACTTzNa3EzABie9=h2X-ONBefyaoWE1+RAT-T+uxJVvVij15Rg@mail.gmail.com>
 <20170821120310.GL1724@mtr-leonro.local> <20170821155729.GC4401@obsidianresearch.com>
From: Yigal Korman <yigal@plexistor.com>
Date: Tue, 22 Aug 2017 09:08:56 +0300
Message-ID: <CACTTzNar-qBRxkeWHL-gt4C9A6yTbY+GbkTT6tWKvJcnpK=J_g@mail.gmail.com>
Subject: Re: Possible rdma-core header conflict
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, mmarek@suse.com, linux-kbuild@vger.kernel.org, dhowells@redhat.com
Cc: Leon Romanovsky <leon@kernel.org>, Linux RDMA Mailing List <linux-rdma@vger.kernel.org>

On Mon, Aug 21, 2017 at 6:57 PM, Jason Gunthorpe
<jgunthorpe@obsidianresearch.com> wrote:
> On Mon, Aug 21, 2017 at 03:03:10PM +0300, Leon Romanovsky wrote:
>> On Mon, Aug 21, 2017 at 12:24:14PM +0300, Yigal Korman wrote:
>> > Hi,
>> > Has anyone noticed that installing rdma-core (or older
>> > librdmacm-devel) package and then installing kernel headers manually
>> > (make headers_install) removes the librdmacm headers?
>> > I actually see it in the make output:
>> >
>> > make INSTALL_HDR_PATH=3D/usr headers_install
>> >   CHK     include/generated/uapi/linux/version.h
>> >   REMOVE  rdma_cma_abi.h rdma_verbs.h rdma_cma.h rsocket.h
>> >
>> > Am I doing something wrong?
>> > Sounds like the kernel rdma headers and librdmacm headers shouldn't
>> > sit in the same directory...
>>
>> It looks like this behavior (removal of header files) was from the begin=
ning of git era.
>> =E2=9E=9C  linux-rdma git:(rdma-next) =E2=9C=97 git co -b tmp v2.6.34.8
>> =E2=9E=9C  linux-rdma git:(tmp) =E2=9C=97 cp ~/src/rdma-core/librdmacm/r=
dma_verbs.h /tmp/h/include/rdma/ && make INSTALL_HDR_PATH=3D/tmp/h headers_=
install | grep REMOVE
>>   REMOVE  rdma_verbs.h
>
> The user space files have also been sharing the directory with the
> kernel files since the start.. Not sure why, but I don't think we can
> change it now.
>
> Maybe someone can patch the kernel to exempt rdma/ from the removal
> process?

Yeah, that would be a good possible fix for this.
I had a quick look at the kernel headers install scripts and didn't
see any mechanism for this, but I might've missed it.
I'm adding linux-kbuild mailing list here, maybe someone there can help?

Thanks

>
> Jason
