Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:19262 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751597AbeCUNfu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Mar 2018 09:35:50 -0400
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com [209.85.213.53]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id w2LDZW2o019948
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Mar 2018 22:35:33 +0900
Received: by mail-vk0-f53.google.com with SMTP id l123so3048897vke.8
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Mar 2018 06:35:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGw6cBtg+yC5KhZYqRtEZY1q5WhjOxH=Laivg8MS5-s2uhqvUA@mail.gmail.com>
References: <20180128225838.1275-1-mforney@mforney.org> <20180319005402.30495-1-mforney@mforney.org>
 <CAK7LNAQuRe_b6GoGBjMWkX0j0eNURZziejYVCAAhOMKUTH=s3Q@mail.gmail.com> <CAGw6cBtg+yC5KhZYqRtEZY1q5WhjOxH=Laivg8MS5-s2uhqvUA@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 21 Mar 2018 22:34:51 +0900
Message-ID: <CAK7LNATwQzc5vD46aOEnv5mYiitynqRVVMkDM2hHszY-T8N2fQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Use ls(1) instead of stat(1) to obtain file size
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Forney <mforney@mforney.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-03-21 15:03 GMT+09:00 Michael Forney <mforney@mforney.org>:
> On 2018-03-20, Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>> 2018-03-19 9:54 GMT+09:00 Michael Forney <mforney@mforney.org>:
>>> From: Michael Forney <forney@google.com>
>>>
>>> stat(1) is not standardized and different implementations have their own
>>> (conflicting) flags for querying the size of a file.
>>>
>>> ls(1) provides the same information (value of st.st_size) in the 5th
>>> column, except when the file is a character or block device. This output
>>> is standardized[0]. The -n option turns on -l, which writes lines
>>> formatted like
>>>
>>>   "%s %u %s %s %u %s %s\n", <file mode>, <number of links>,
>>>       <owner name>, <group name>, <size>, <date and time>,
>>>       <pathname>
>>>
>>> but instead of writing the <owner name> and <group name>, it writes the
>>> numeric owner and group IDs (this avoids /etc/passwd and /etc/group
>>> lookups as well as potential field splitting issues).
>>>
>>> The <size> field is specified as "the value that would be returned for
>>> the file in the st_size field of struct stat".
>>>
>>> To avoid duplicating logic in several locations in the tree, create
>>> scripts/file-size.sh and update callers to use that instead of stat(1).
>>>
>>> [0]
>>> http://pubs.opengroup.org/onlinepubs/9699919799/utilities/ls.html#tag_20_73_10
>>>
>>> Signed-off-by: Michael Forney <forney@google.com>
>>> ---
>>> Changes in v2:
>>> * Use a wrapper script instead of calling ls(1) directly.
>>> * Also replace a couple of other instances of `stat -c '%s'`.
>>> * Update description with justification of ls(1) usage.
>>>
>>
>> Applied to linux-kbuild. Thanks!
>
> Thanks, Masahiro!
>
> However, I just realized that we probably need to revert the change to
> tools/testing/selftests/efivarfs/efivarfs.sh since it is called
> through a separate Makefile system that does not have $CONFIG_SHELL
> and $srctree defined.
>
> Sorry for the mistake.

OK, I reverted the offending part.



-- 
Best Regards
Masahiro Yamada
