Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot0-f195.google.com ([74.125.82.195]:42270 "EHLO
        mail-ot0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751040AbeCUGDd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Mar 2018 02:03:33 -0400
Received: by mail-ot0-f195.google.com with SMTP id v23-v6so4448625oth.9
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Mar 2018 23:03:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQuRe_b6GoGBjMWkX0j0eNURZziejYVCAAhOMKUTH=s3Q@mail.gmail.com>
References: <20180128225838.1275-1-mforney@mforney.org> <20180319005402.30495-1-mforney@mforney.org>
 <CAK7LNAQuRe_b6GoGBjMWkX0j0eNURZziejYVCAAhOMKUTH=s3Q@mail.gmail.com>
From: Michael Forney <mforney@mforney.org>
Date: Tue, 20 Mar 2018 23:03:32 -0700
Message-ID: <CAGw6cBtg+yC5KhZYqRtEZY1q5WhjOxH=Laivg8MS5-s2uhqvUA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Use ls(1) instead of stat(1) to obtain file size
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On 2018-03-20, Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> 2018-03-19 9:54 GMT+09:00 Michael Forney <mforney@mforney.org>:
>> From: Michael Forney <forney@google.com>
>>
>> stat(1) is not standardized and different implementations have their own
>> (conflicting) flags for querying the size of a file.
>>
>> ls(1) provides the same information (value of st.st_size) in the 5th
>> column, except when the file is a character or block device. This output
>> is standardized[0]. The -n option turns on -l, which writes lines
>> formatted like
>>
>>   "%s %u %s %s %u %s %s\n", <file mode>, <number of links>,
>>       <owner name>, <group name>, <size>, <date and time>,
>>       <pathname>
>>
>> but instead of writing the <owner name> and <group name>, it writes the
>> numeric owner and group IDs (this avoids /etc/passwd and /etc/group
>> lookups as well as potential field splitting issues).
>>
>> The <size> field is specified as "the value that would be returned for
>> the file in the st_size field of struct stat".
>>
>> To avoid duplicating logic in several locations in the tree, create
>> scripts/file-size.sh and update callers to use that instead of stat(1).
>>
>> [0]
>> http://pubs.opengroup.org/onlinepubs/9699919799/utilities/ls.html#tag_20_73_10
>>
>> Signed-off-by: Michael Forney <forney@google.com>
>> ---
>> Changes in v2:
>> * Use a wrapper script instead of calling ls(1) directly.
>> * Also replace a couple of other instances of `stat -c '%s'`.
>> * Update description with justification of ls(1) usage.
>>
>
> Applied to linux-kbuild. Thanks!

Thanks, Masahiro!

However, I just realized that we probably need to revert the change to
tools/testing/selftests/efivarfs/efivarfs.sh since it is called
through a separate Makefile system that does not have $CONFIG_SHELL
and $srctree defined.

Sorry for the mistake.
