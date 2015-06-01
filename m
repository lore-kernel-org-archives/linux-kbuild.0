Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:34204 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752916AbbFAIft (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Jun 2015 04:35:49 -0400
Received: by wibut5 with SMTP id ut5so31242844wib.1
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Jun 2015 01:35:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1433034886.6319.80.camel@decadent.org.uk>
References: <1432804275-13187-3-git-send-email-riku.voipio@linaro.org>
	<1433034886.6319.80.camel@decadent.org.uk>
Date: Mon, 1 Jun 2015 11:35:47 +0300
Message-ID: <CAAqcGH=whsuOKZRcGRkKHPH_ZxNp+DWmAs-fjYcHp9fRT3JLSg@mail.gmail.com>
Subject: Re: [PATCH 2/2] deb-pkg: add source package
From: Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, mmarek <mmarek@suse.cz>, debian-kernel <debian-kernel@lists.debian.org>, maximilian attems <maks@stro.at>

On 31 May 2015 at 04:14, Ben Hutchings <ben@decadent.org.uk> wrote:
> On Thu, 2015-05-28 at 12:11 +0300, riku.voipio@linaro.org wrote:
>> From: Riku Voipio <riku.voipio@linaro.org>
>>
>> By passing BUILD_SOURCE=y variable, make deb-pkg builds a debian source
>> package. It will generate a minimal debian/rules file that calls back
>> to make deb-pkg. Generated source package will build the same kernel
>> .config than what was available for make deb-pkg.
>>
>> The source package is useful for gpl compliance, or for feeding to a
>> automated debian package builder.
>>
>> v2, address Maximilians comments
>>
>> - Isolate from my other patches, so it can be merged easier
>> - Separate bindeb-pkg target for building just binary debs
>> - Build source package in deb-pkg target to match rpm-pkg target
> [...]
>> --- a/scripts/package/builddeb
>> +++ b/scripts/package/builddeb
>> @@ -265,12 +265,16 @@ On Debian GNU/Linux systems, the complete text of the GNU General Public
>>  License version 2 can be found in \`/usr/share/common-licenses/GPL-2'.
>>  EOF
>>
>> +
>> +build_depends="bc, kmod, cpio, python "

> Why python?

I recall seeing python called sometimes in kernel build, and it's
alsoin debian kernel build-depends. However, a quick git grep suggests
this would be ia64 only.

>>  # Generate a control file
>>  cat <<EOF > debian/control
>>  Source: linux-upstream
>>  Section: kernel
>>  Priority: optional
>>  Maintainer: $maintainer
>> +Build-Depends: $build_depends
>>  Standards-Version: 3.8.4
>>  Homepage: http://www.kernel.org/
>>  EOF
>> @@ -391,4 +395,33 @@ EOF
>>       create_package "$dbg_packagename" "$dbg_dir"
>>  fi
>>
>> +if [ "x$1" = "xdeb-pkg" ]
>> +then
>> +    cat <<EOF > debian/rules
>> +#!/usr/bin/make -f
>> +
>> +build:
>> +     cp debian/config .config
>> +     \$(MAKE) oldconfig
>> +
>> +binary-arch:
>> +     \$(MAKE) KDEB_PKGVERSION=${packageversion} deb-pkg
>
> This should invoke the bindeb-pkg target.

good catch, will fix.

>> +clean:
>> +     \$(MAKE) clean
>> +
>> +binary: binary-arch
>> +EOF
>> +
>> +     (cd $KBUILD_SRC; git archive --prefix=linux-upstream-${version}/ HEAD)|gzip -9 > ../linux-upstream_${version}.orig.tar.gz

> Not xz?  (Which would add a build-dependency, of course.)

I tried to keep this as universally usable as possible. Can we assume
xz installed these days? In debian/ubuntu yes, but do we want to cater
users of other distributions as well?

> Ben.
>
>> +     cp $KCONFIG_CONFIG debian/config
>> +     tar caf ../linux-upstream_${packageversion}.debian.tar.gz debian/{config,copyright,rules,changelog,control}
>> +     dpkg-source -cdebian/control -ldebian/changelog --format="3.0 (custom)" --target-format="3.0 (quilt)" \
>> +             -b / ../linux-upstream_${version}.orig.tar.gz  ../linux-upstream_${packageversion}.debian.tar.gz
>> +     mv linux-upstream_${packageversion}*dsc ..
>> +     dpkg-genchanges > ../linux-upstream_${packageversion}_${debarch}.changes
>> +else
>> +     dpkg-genchanges -b > ../linux-upstream_${packageversion}_${debarch}.changes
>> +fi
>> +
>>  exit 0
>
> --
> Ben Hutchings
> Reality is just a crutch for people who can't handle science fiction.
