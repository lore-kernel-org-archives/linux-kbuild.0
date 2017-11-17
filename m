Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:29189 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933916AbdKQJJO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Nov 2017 04:09:14 -0500
Message-ID: <1510909724.3063.55.camel@oracle.com>
Subject: Re: [PATCH 0/7] Support for automatic checkpatch running in the
 kernel
From: Knut Omang <knut.omang@oracle.com>
Date: Fri, 17 Nov 2017 10:08:44 +0100
In-Reply-To: <cover.3dd1d0c1f15a7a7c418f20ebafc9719afc1c2704.1510840787.git-series.knut.omang@oracle.com>
References: <cover.3dd1d0c1f15a7a7c418f20ebafc9719afc1c2704.1510840787.git-series.knut.omang@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: =?ISO-8859-1?Q?=C5smund_=D8stvold?= <asmund.ostvold@oracle.com>, =?ISO-8859-1?Q?H=E5kon?= Bugge <haakon.bugge@oracle.com>, John Haxby <john.haxby@oracle.com>, Kees Cook <keescook@chromium.org>, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, =?ISO-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Andy Whitcroft <apw@canonical.com>

I realize the Cc: list for the cover letter probably should have included all 
the relevant maintainers for this set, sorry about that!

For convenience I also put up a more reader friendly copy of the doc after patch 7 here:

http://heim.ifi.uio.no/~knuto/kernel/4.14/dev-tools/run-checkpatch.html

Thanks,
Knut

On Thu, 2017-11-16 at 18:01 +0100, Knut Omang wrote:
> This patch series implements features to facilitate running checkpatch on the
> entire kernel as part of automatic testing.
> 
> This is done by by adding a few small features to checkpatch and put these
> features to use to implement support for a new Makefile environment variable
> P={1,2} following the pattern of sparse and the C={1,2} variable.  The basic
> functionality + docs are in patch #1-4.
> 
> It also fixes a minor issue with "checkpatch --fix-inplace" found during testing
> (patch #5).
> 
> The most important checkpatch feature added is the --ignore-cfg feature, which
> takes a file argument and parses that file according to this minimal language:
> 
>        # comments
>        line_len <n>
>        except checkpatch_type [files ...]
>        pervasive checkpatch_type1 [checkpatch_type2 ...]
> 
> With "make P=2" checkpatch is called with "--file" and "--ignore_cfg
> checkpatch.cfg" which causes it to look for a file named 'checkpatch.cfg' in the
> same directory as the source file. If that file exists, checkpatch will be run
> with an implicit --strict and with the @ignore list expanded with content from
> the configuration file.  If it does not exist, make will simply silently ignore
> the file.
> 
> Patches #6-7 enhances this behaviour to also scan the directories above a file
> until a match for the --file parameter is found.
> 
> The idea is that the community can work to add checkpatch.cfg files to
> directories, serving both as documentation and as a way for subsystem
> maintainers to enforce policies and individual tastes as well as TODOs and/or
> priorities, to make it easier for newcomers to contribute in this area. By
> ignoring directories without such files, automation can start right away as it
> is trivially possible to run errorless with P=2 for the entire kernel.
> 
> The patches includes a documentation file with some more details.
> 
> This patch set has evolved from an earlier implementation I made that was just a
> wrapper script around checkpatch. That version have been used for a number of
> years on a driver project I worked on where we had automatic checkin regression
> testing. I extended that to also run checkpatch to avoid having to clean up
> frequent unintended whitespace changes and style violations from others...
> 
> I have also tested this version on some directories I am familiar with.  The
> result of that work is available in two patch sets of 10 and 11 patches, but we
> agreed that it would be better to post them as separate patch sets later.
> 
> Those patch sets illustrates how I picture the "flow" from just "reining in" the
> checkpatch detections to actually fixing classes of checkpatch issues one by
> one, while updating the checkpatch.cfg file(s) to have 0 errors or warnings at
> any commit boundary.
> 
> The combined set is available here:
> 
>    git://github.com/knuto/linux.git  branch checkpatch
> 
> Comments and suggestions appreciated!
> 
> Thanks,
> Knut
> 
> Knut Omang (7):
>   checkpatch: Implement new --ignore-cfg parameter
>   kbuild: Add P= command line flag to run checkpatch
>   checkpatch: Add a few convenience options to disable/modify features
>   Documentation: Add documentation for the new P= Makefile option
>   checkpatch: Improve --fix-inplace for TABSTOP
>   checkpatch: Make --ignore-cfg look recursively for the file
>   Documentation: Update checkpatch --ignore-cfg description
> 
>  Documentation/dev-tools/index.rst          |   1 +-
>  Documentation/dev-tools/run-checkpatch.rst | 109 ++++++++++++++++++++++-
>  Makefile                                   |  20 +++-
>  scripts/Makefile.build                     |  13 +++-
>  scripts/checkpatch.pl                      | 108 +++++++++++++++++++++-
>  5 files changed, 249 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/dev-tools/run-checkpatch.rst
> 
> base-commit: bebc6082da0a9f5d47a1ea2edc099bf671058bd4
