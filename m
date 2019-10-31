Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:40904 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbfJaF1V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 31 Oct 2019 01:27:21 -0400
Subject: Re: [PATCH] scripts: prune-kernel:remove old kernels and modules dir
 from system
References: <20191030095445.912435-1-unixbhaskar@gmail.com>
 <b8a12c03-1e17-61de-2cd9-a09650dc22b1@infradead.org>
 <20191031033722.GA7687@Gentoo>
 <41693d0e-8ff2-bf06-f1a6-e7fb52779f95@infradead.org>
 <20191031045242.GA3130@Gentoo>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <809aa850-7a22-a7c5-af21-0e88d1c63dd7@infradead.org>
Date: Wed, 30 Oct 2019 22:27:19 -0700
MIME-Version: 1.0
In-Reply-To: <20191031045242.GA3130@Gentoo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: bfields@fieldses.org, yamada.masahiro@socionext.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/30/19 9:52 PM, Bhaskar Chowdhury wrote:
>>>> That 'rm' doesn't remove any files.  Compare what remove_old_kernel() does.
>>> No,it is not using that function rather take the parameter from the
>>> commandline and get into boot dir match with it and remove it.
>>
>> But it doesn't do that.  I tested it.  It should be more like what
>> rmeove_old_kernel() does:
>>
>>         rm -If vmlinuz-$kernel_ver System.map-$kernel_ver config-$kernel_ver
>>
>> and if not, please explain why not.
> Okay, again some uniformity missing in the code, I would like to your
> suggested method,i.e call remove_old_kernel to do the job instead of depending on individual kernel.

The simplest thing to do is set kernel_version=$kernel_ver
and then call remove_old_kernel().
And set modules_version=$modules_dir_name and call remove_old_modules_dir().

But it would be cleaner to pass a parameter (kernel_version) to the
remove_old_kernel() function and to pass a parameter (modules_dir) to the
remove_old_modules_dir() function.


-- 
~Randy
