Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36352 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754069AbcEONoS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 15 May 2016 09:44:18 -0400
Received: by mail-wm0-f65.google.com with SMTP id w143so12753539wmw.3
        for <linux-kbuild@vger.kernel.org>; Sun, 15 May 2016 06:44:17 -0700 (PDT)
Date: Sun, 15 May 2016 15:44:13 +0200
From: Eugeniu Rosca <eugeniu.m.rosca@gmail.com>
Subject: Re: [PATCH] scripts/tags.sh: Exit gracefully if *tags tool not found
Message-ID: <20160515134413.GA14628@eugeniu-X230>
References: <1461516120-5600-1-git-send-email-eugeniu.m.rosca@gmail.com>
 <571E0F1F.8090204@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <571E0F1F.8090204@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org

On Mon, Apr 25, 2016 at 02:35:43PM +0200, Michal Marek wrote:
> On 2016-04-24 18:42, Eugeniu Rosca wrote:
> > If the needed host utility is not found, current behavior is:
> > 
> > $> make cscope
> >   GEN     cscope
> > ./scripts/tags.sh: line 140: cscope: command not found
> > $> make gtags
> >   GEN     gtags
> > ./scripts/tags.sh: line 145: gtags: command not found
> > $> make tags
> >   GEN     tags
> > xargs: ctags: No such file or directory
> > sed: can't read tags: No such file or directory
> > Makefile:1509: recipe for target 'tags' failed
> > make: *** [tags] Error 2
> > $> make TAGS
> >   GEN     TAGS
> > xargs: etags: No such file or directory
> > sed: can't read TAGS: No such file or directory
> > Makefile:1509: recipe for target 'TAGS' failed
> > make: *** [TAGS] Error 2
> > 
> > This patch allows to exit gracefully in such a situation:
> > 
> > $> make cscope
> >   GEN     cscope
> > cscope - not installed?
> > $> make gtags
> >   GEN     gtags
> > gtags - not installed?
> > $> make tags
> >   GEN     tags
> > ctags - not installed?
> > $> make TAGS
> >   GEN     TAGS
> > etags - not installed?
> 
> It should fail if it's unable to create the requested file, though.
> Appending '|| exit' to the docscope/dogtags/xtags calls should suffice.
> 
> Michal

Hi Michal,

Late feedback from my end...
I would kindly ask you to select one of the options provided below:

OPTION 1: Append '|| exit' to the docscope/dogtags/xtags calls.
RESULT: This produces more error messages than with the original script:

$> make cscope
  GEN     cscope
./scripts/tags.sh: line 140: cscope: command not found
Makefile:1517: recipe for target 'cscope' failed
make: *** [cscope] Error 127
$> make gtags
  GEN     gtags
./scripts/tags.sh: line 145: gtags: command not found
Makefile:1517: recipe for target 'gtags' failed
make: *** [gtags] Error 127
$> make tags
  GEN     tags
xargs: ctags: No such file or directory
Makefile:1517: recipe for target 'tags' failed
make: *** [tags] Error 127
$> make TAGS
  GEN     TAGS
xargs: etags: No such file or directory
Makefile:1517: recipe for target 'TAGS' failed
make: *** [TAGS] Error 127
$> 

OPTION 2: Append '|| exit 0' to the docscope/dogtags/xtags calls.
RESULT: Cleaner output, but still without suggesting the root-cause:

$> make cscope
GEN     cscope
./scripts/tags.sh: line 140: cscope: command not found
$> make gtags
GEN     gtags
./scripts/tags.sh: line 145: gtags: command not found
$> make tags
GEN     tags
xargs: ctags: No such file or directory
$> make TAGS
GEN     TAGS
xargs: etags: No such file or directory
$>

OPTION 3: Initial patch.
RESULT: Cleaner output, but maybe putting too much infrastructure for
checking against missing utilities?

$> make cscope
GEN     cscope
cscope - not installed?
$> make gtags
GEN     gtags
gtags - not installed?
$> make tags
GEN     tags
ctags - not installed?
$> make TAGS
GEN     TAGS
etags - not installed?

OPTION 4: Something else?
RESULT: ?

Best regards,
Eugeniu.
