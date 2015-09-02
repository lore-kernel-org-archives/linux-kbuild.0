Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:36957 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751571AbbIBIJW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Sep 2015 04:09:22 -0400
Received: by wicfx3 with SMTP id fx3so9811373wic.0
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Sep 2015 01:09:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1441149974.9215.59.camel@decadent.org.uk>
References: <1441115335-25165-2-git-send-email-riku.voipio@linaro.org>
	<1441149974.9215.59.camel@decadent.org.uk>
Date: Wed, 2 Sep 2015 11:09:20 +0300
Message-ID: <CAAqcGHkUW36=Yf87x59tuKXExA2YrQyW2=iWp=3_Exf0WVJurg@mail.gmail.com>
Subject: Re: [PATCH v4] deb-pkg: add source package
From: Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, mmarek <mmarek@suse.cz>, Chris J Arges <chris.j.arges@canonical.com>, maximilian attems <maks@stro.at>

On 2 September 2015 at 02:26, Ben Hutchings <ben@decadent.org.uk> wrote:
> KDEB_SOURCENAME, not SOURCENAME.

Argh, last minute changes in variable names was a bad idea. Fixing up.

>> The source package is useful for GPL compliance, or for feeding to a
>> automated debian package builder.
>>
>> Cc: Chris J Arges <chris.j.arges@canonical.com>
>> Cc: maximilian attems <maks@stro.at>
>> Cc: Ben Hutchings <ben@decadent.org.uk>
>> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
>> ---
>> v4 address Bens commends,
>> - use src_tar function instead of git archive for kernel sources
>> - move KDEB_SOURCENAME setting to Makefile so it can be passed to
>>   src_tar
>> - use a toplevel .config file instead of a copy in debian/control
>> - defend against delete of debian/ in clean target
> [...]
>> @@ -391,4 +396,32 @@ EOF
>>  >    > create_package "$dbg_packagename" "$dbg_dir"
>>  fi
>>
>> +if [ "x$1" = "xdeb-pkg" ]
>> +then
>> +    cat < debian/rules
>> +#!/usr/bin/make -f
>> +
>> +build:
>> +>    > \$(MAKE) sourcename=${sourcename} KDEB_PKGVERSION=${packageversion}

> I don't think this needs to set any variables, though it shouldn't
> hurt.

Ok, I thought that make calls with different parameters might trigger
rebuild, but after some tests this doesn't seem the case. Cleaning up.

>> +binary-arch:
>> +     \$(MAKE) sourcename=${sourcename} KDEB_PKGVERSION=${packageversion} bindeb-pkg
> [...]

> Shouldn't this be setting KDEB_SOURCENAME, not sourcename?

Like the variable name in comments, yes. Thanks for patient reviews.

Riku
