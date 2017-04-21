Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:20815 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1037512AbdDUJ5U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Apr 2017 05:57:20 -0400
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com [209.85.161.175]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id v3L9v7Tx004781
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Apr 2017 18:57:08 +0900
Received: by mail-yw0-f175.google.com with SMTP id k11so4341070ywb.1
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Apr 2017 02:57:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAAqcGHk80P4tKFn+j5n6M=77XaDFkc_e30RZ04+MmMf=qJDyzw@mail.gmail.com>
References: <20170331130941.5250-1-riku.voipio@linaro.org> <20170331130941.5250-4-riku.voipio@linaro.org>
 <CAK7LNAQT8pSjgW5ujnWWP3MKfU0=XnFKWVeNu-fx5NRRX0XgMg@mail.gmail.com> <CAAqcGHk80P4tKFn+j5n6M=77XaDFkc_e30RZ04+MmMf=qJDyzw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 21 Apr 2017 18:57:06 +0900
Message-ID: <CAK7LNAQ5V-B+Os2WZZb3H6hqCOsNtSvTZJw-kJmt5hP_xS+QcA@mail.gmail.com>
Subject: Re: [PATCH 3/3] builddeb: add make fastdeb-pkg target
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, debian-kernel <debian-kernel@lists.debian.org>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>

Hi Riku,


2017-04-20 19:53 GMT+09:00 Riku Voipio <riku.voipio@linaro.org>:
> Hi,
>
> Thanks for taking time to review.
>
> On 18 April 2017 at 17:31, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> Before expanding this even more,
>> please help me understand this script.
>>
>> Commit 3716001b implemented source package build
>> at the end of the builddeb script.
>> However, the binary packages are still built in its own way.
>> (So, debian/rules is not used in general workflows,
>> so we need to test it explicitly somehow.)
>
> Historic reasons.. since the builddeb already existed, the easiest way
> to implement debian/rules was to make a skeleton debian/rules that
> calls builddeb indrectly.
>
>> Why do not we create a source package first,
>> then build binary packages from it?
>
> I wouldn't do a source package per se, but we could create a debian/
> directory tree and the call dpkg-buildpackage. This would be a more
> substantial overhaul that might break some expected behavior of
> deb-pkg targets. If people think its worth, I can give it a shot.


In hindsight, it seems more straightforward to me
to build the binary packages from the source package.
But, I know this refactoring will need lots of changes, which may
break something.

Once we support this fastdeb-pkg target,
we will not be able to convert the script in that way.
(because we do not have a standard way to generate a particular binary
package from *.dsc)
That's why I asked the question, and I want to be careful.



>> rpm-pkg does that way.
>> (generate a spec-file, then run rpmbuild)
>
> speaking of the mkspec script, it would be nice to refactor it to here
> documents over endless lines of echo.

As always, cleaning patches are welcome.



-- 
Best Regards
Masahiro Yamada
