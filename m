Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39333 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730484AbgFHQXL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jun 2020 12:23:11 -0400
References: <CAK7LNASQamajjeV+VMq5G8fECfB6f9uKvZ32zGic72O0qp8Mtw@mail.gmail.com>
 <20200608095944.140779-1-efremov@linux.com>
 <20200608153646.GA25087@angband.pl>
From: Denis Efremov <efremov@linux.com>
Subject: Re: [PATCH] kbuild: fix broken builds because of GZIP,BZIP2,LZOP
 variables
Message-ID: <ac518eac-aa9c-107b-3330-a18f219c89b5@linux.com>
Date: Mon, 8 Jun 2020 19:23:04 +0300
MIME-Version: 1.0
In-Reply-To: <20200608153646.GA25087@angband.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adam Borowski <kilobyte@angband.pl>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>



On 6/8/20 6:36 PM, Adam Borowski wrote:
> On Mon, Jun 08, 2020 at 12:59:44PM +0300, Denis Efremov wrote:
>> Redefine GZIP, BZIP2, LZOP variables as KGZIP, KBZIP2, KLZOP resp.
>> GZIP, BZIP2, LZOP env variables are reserved by the tools. The original
>> attempt to redefine them internally doesn't work in makefiles/scripts
>> intercall scenarios, e.g., "make GZIP=gzip bindeb-pkg" and results in
>> broken builds. There can be other broken build commands because of this,
>> so the universal solution is to use non-reserved env variables for the
>> compression tools.
>>
>> Fixes: 8dfb61dcbace ("kbuild: add variables for compression tools")
> 
> Same said my bisect before I noticed your fix. :)
> 
>> Signed-off-by: Denis Efremov <efremov@linux.com>
> 
> However, I run just basic "make bindeb-pkg" without forcing any variables,
> thus the commit message is wrong.

I would not say it's fully wrong. At least in my case "make bindeb-pkg" builds
successfully (Fedora32/Debian10). I just added to the commit's message the
command "make GZIP=gzip bindeb-pkg" as an example that I think will "reliably"
break the build in any environment.

Thanks,
Denis
