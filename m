Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:23190 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932630AbdKQErc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 23:47:32 -0500
Message-ID: <1510894030.3063.41.camel@oracle.com>
Subject: Re: [PATCH 0/7] Support for automatic checkpatch running in the
 kernel
From: Knut Omang <knut.omang@oracle.com>
Date: Fri, 17 Nov 2017 05:47:10 +0100
In-Reply-To: <CAGXu5j+j0TZ+QUMf09eifTwOwmgA=3AbA3e2PJQehKF61hMcRA@mail.gmail.com>
References: <cover.3dd1d0c1f15a7a7c418f20ebafc9719afc1c2704.1510840787.git-series.knut.omang@oracle.com>
         <CAGXu5j+j0TZ+QUMf09eifTwOwmgA=3AbA3e2PJQehKF61hMcRA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, =?ISO-8859-1?Q?=C5smund_=D8stvold?= <asmund.ostvold@oracle.com>, =?ISO-8859-1?Q?H=E5kon?= Bugge <haakon.bugge@oracle.com>, John Haxby <john.haxby@oracle.com>, linux-doc@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, =?ISO-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Joe Perches <joe@perches.com>

On Thu, 2017-11-16 at 14:57 -0800, Kees Cook wrote:
> On Thu, Nov 16, 2017 at 9:01 AM, Knut Omang <knut.omang@oracle.com> wrote:
> > The most important checkpatch feature added is the --ignore-cfg feature, which
> > takes a file argument and parses that file according to this minimal language:
> >
> >        # comments
> >        line_len <n>
> >        except checkpatch_type [files ...]
> >        pervasive checkpatch_type1 [checkpatch_type2 ...]
> >
> > With "make P=2" checkpatch is called with "--file" and "--ignore_cfg
> > checkpatch.cfg" which causes it to look for a file named 'checkpatch.cfg' in the
> > same directory as the source file. If that file exists, checkpatch will be run
> > with an implicit --strict and with the @ignore list expanded with content from
> > the configuration file.  If it does not exist, make will simply silently ignore
> > the file.
> 
> Will these configurations be cascading? (For example, all of net/ uses
> a different comment style, so having that recorded in a single file
> would be nice.)

Good point, the net/ use case is certainly something I have been thinking about.
I didn't want to make it too complex in the first set, so I let patch 1-4
implement the basics with one file per directory and nothing across directories.

Patch 6 and 7 in this set extends this to "fallback", which (with the net/ case in mind)
should allow a single file under net/ to cover the whole subsystem for all subtrees that
don't have their own checkpatch.cfg, but will be overridden by files in subdirectories.

So from a documentation point of view this could be done with the set as it is,
with people just copying the "pervasive" and "line_len" commands from
a "global" net/checkpatch.cfg setup down into the subtrees as they start dealing with 
exceptions.

If we want something more automatic, it can certainly be extended, 
this would just require checkpatch to parse all the upwards checkpatch.cfg files for each
source file instead just taking the first found, which is what patch 6 implements.

Also the command language in the config files is rather limited, maybe other commands
maybe with more checkpatch additions would be useful to handle such scenarios..

Let me know what you think..

Thanks,
Knut
