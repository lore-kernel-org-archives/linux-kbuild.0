Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54825 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750771AbbDBOSi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Apr 2015 10:18:38 -0400
Message-ID: <551D4FBC.5010007@suse.cz>
Date: Thu, 02 Apr 2015 16:18:36 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] deb-pkg: Add automatic support for armhf architecture
References: <cover.1427968988.git.riku.voipio@linaro.org>	<834bd55c0de686780eb15f9a06b13f7fb560e9a8.1427968988.git.riku.voipio@linaro.org>	<87fv8i3fiw.fsf@lebrac.rtp-net.org> <CAAqcGH=iT4-R=D+WWCZ2ibKHnc8dGgHPyC+5WyOT2WM=LuJwRA@mail.gmail.com>
In-Reply-To: <CAAqcGH=iT4-R=D+WWCZ2ibKHnc8dGgHPyC+5WyOT2WM=LuJwRA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>, Arnaud Patard <arnaud.patard@rtp-net.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, debian-kernel <debian-kernel@lists.debian.org>, Ben Hutchings <ben@decadent.org.uk>, debian-arm@lists.debian.org

On 2015-04-02 15:14, Riku Voipio wrote:
> On 2 April 2015 at 15:01, Arnaud Patard <arnaud.patard@rtp-net.org> wrote:
>> riku.voipio@linaro.org writes:
>>> --- a/scripts/package/builddeb
>>> +++ b/scripts/package/builddeb
>>> @@ -45,7 +45,16 @@ create_package() {
>>>       arm64)
>>>               debarch=arm64 ;;
>>>       arm*)
>>> -             debarch=arm$(grep -q CONFIG_AEABI=y $KCONFIG_CONFIG && echo el || true) ;;
>>> +             if grep -q CONFIG_AEABI=y $KCONFIG_CONFIG; then
>>> +                     if $CC -dM -E - < /dev/null|grep -q __ARM_PCS_VFP; then
>>
>> Actually, I guess there's nothing preventing you building a armhf kernel
>> with a compiler not having __ARM_PCS_VFP defined by default, but I'm not sure
>> we should take care of this case. One can always use KBUILD_DEBARCH=armhf.
> 
> I think the common use cases would be a) native compilers or b)
> cross-compiler targeting the same debian architecture as the rootfs.
> This patch provides automatic detection for both cases.

$CC should be used together with $KBUILD_CFLAGS to behave the same as
when building the kernel.

Michal
