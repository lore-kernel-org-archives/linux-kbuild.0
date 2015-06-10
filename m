Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:37368 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752109AbbFJKEz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 10 Jun 2015 06:04:55 -0400
Received: by wifx6 with SMTP id x6so41826542wif.0
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Jun 2015 03:04:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1433834784.3041.1.camel@debian.org>
References: <1432804275-13187-3-git-send-email-riku.voipio@linaro.org>
	<1433834784.3041.1.camel@debian.org>
Date: Wed, 10 Jun 2015 13:04:53 +0300
Message-ID: <CAAqcGHk2BZH4Tjm_mCkWoLJ3xQqJCUaoWyaGDEMPnOFdJs4HNg@mail.gmail.com>
Subject: Re: [2/2] deb-pkg: add source package
From: Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Yves-Alexis Perez <corsac@debian.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, mmarek <mmarek@suse.cz>, debian-kernel <debian-kernel@lists.debian.org>, maximilian attems <maks@stro.at>

On 9 June 2015 at 10:26, Yves-Alexis Perez <corsac@debian.org> wrote:
> On jeu., 2015-05-28 at 12:11 +0300, Riku Voipio wrote:
>> +       dpkg-genchanges > ../linux-upstream_${packageversion}_
>> ${debarch}.changes
>> +else
>> +       dpkg-genchanges -b > ../linux-upstream_${packageversion}_
>> ${debarch}.changes
>
> ${debarch} seems empty here when using make deb-pkg, not too sure why
> (I'm building using KBUILD_OUTPUT, not sure if it's related).

Hi Yves,

You are missing the patch already qued that is sets the debarch variable:

https://kernel.googlesource.com/pub/scm/linux/kernel/git/mmarek/kbuild/+/dca0c0246fb739bccdd19ff2bfd0f02ccffdb07c

Riku
