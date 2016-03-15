Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:34945 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750853AbcCOAKk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Mar 2016 20:10:40 -0400
Received: by mail-lb0-f180.google.com with SMTP id bc4so1380168lbc.2
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Mar 2016 17:10:39 -0700 (PDT)
Received: from lenovo.home ([93.171.170.21])
        by smtp.gmail.com with ESMTPSA id s5sm3910671lbr.12.2016.03.14.17.10.36
        for <linux-kbuild@vger.kernel.org>
        (version=TLSv1/SSLv3 cipher=OTHER);
        Mon, 14 Mar 2016 17:10:37 -0700 (PDT)
Subject: Re: rela sections in vmlinux
References: <56DC9B44.6020104@gmail.com>
From: Ruslan Kuprieiev <kupruser@gmail.com>
Message-ID: <56E752FB.6000300@gmail.com>
Date: Tue, 15 Mar 2016 02:10:35 +0200
MIME-Version: 1.0
In-Reply-To: <56DC9B44.6020104@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi All,

Just wanted to answer my own question.

The problem was that I forgot to add --emit-relocs to my own script and
that's why I didn't find any rela sections in vmlinux. After adding proper
ld options everything started to make sense =).

Thanks,
Ruslan

On 03/06/2016 11:04 PM, Ruslan Kuprieiev wrote:
> Hi!
>
> I'm trying to figure out how CONFIG_RELOCATABLE works and one of the 
> things
> that I've noticed is that vmlinux itself doesn't have any rela 
> sections, which is
> confusing for me considering the name of the option. I did read the 
> patches that
> introduced this option but it is still not clear to me how exactly it 
> works and why
> there are no relocations left in the vmlinux. Could you please give me 
> a hint on
> why it happens and point me where to read more?
>
> I also see that vmlinux.o has all the rela sections I'm looking for(as 
> an object file
> should =)), so it raises another question: Is it possible to make 
> vmlinux keep that
> rela sections? I also went through makefiles but couldn't figure out 
> where to
> make a proper change to achieve that.
>
> I'm using default 3.10.0-229.20.1.el7.x86_64 centos7 kernel with 
> CONFIG_RELOCATABLE
> enabled.
>
> Thanks,
> Ruslan

