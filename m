Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:33873 "EHLO
	mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752797AbcHRAdb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Aug 2016 20:33:31 -0400
Received: by mail-it0-f68.google.com with SMTP id e63so1102442ith.1
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Aug 2016 17:33:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+r1ZhgewOjmCFpjnZw6LgC6ea2UY0rxW0Js6oiAENioYPV_pQ@mail.gmail.com>
References: <1471383577-18173-1-git-send-email-dmonakhov@openvz.org> <CA+r1ZhgewOjmCFpjnZw6LgC6ea2UY0rxW0Js6oiAENioYPV_pQ@mail.gmail.com>
From: Jim Davis <jim.epost@gmail.com>
Date: Wed, 17 Aug 2016 17:33:19 -0700
Message-ID: <CA+r1ZhhOCx-hRksofgRaBstJko7kpoaU9HXyidvtCY6jYLVpmw@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts: buildtar fix build w/o modules v2
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dmitry Monakhov <dmonakhov@openvz.org>
Cc: linux-kbuild@vger.kernel.org

On Wed, Aug 17, 2016 at 3:19 PM, Jim Davis <jim.epost@gmail.com> wrote:
> On Tue, Aug 16, 2016 at 2:39 PM, Dmitry Monakhov <dmonakhov@openvz.org> wrote:
>> If build configured w/o modules script fails because lib/ is not exit.
>
> Tested-by: Jim Davis <jim.epost@gmail.com>

But apparently not tested very well.  My script ran the no-modules (no
/lib) case and that worked just fine.  But for the modules case,
which I forgot to script, it  oddly failed on my workstation with

+ tar cf - -C ./tar-install boot lib --owner=root --group=root
+ cat
tar: boot lib: Cannot stat: No such file or directory

I've gotta dash,   but a quick 'n dirty change of "$tarball_dirs" to
$tarball_dirs (no quotes)  in the tar command line got by that.  Not
sure if that's just something weird in my test setup or not...

-- 
Jim
