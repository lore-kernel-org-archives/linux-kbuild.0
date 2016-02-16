Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f182.google.com ([209.85.161.182]:34932 "EHLO
	mail-yw0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755335AbcBPPb2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 16 Feb 2016 10:31:28 -0500
Received: by mail-yw0-f182.google.com with SMTP id g127so141819828ywf.2
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Feb 2016 07:31:27 -0800 (PST)
Date: Tue, 16 Feb 2016 10:32:15 -0500
From: Tom Rini <trini@konsulko.com>
Subject: Re: [PATCH] kbuild: fixdep: Check fstat(2) return value
Message-ID: <20160216153215.GA19597@bill-the-cat>
References: <1449523568-31084-1-git-send-email-trini@konsulko.com>
 <CA+M6bXnTB286iFoSFUneGq=1PCJtmnR_PBrqMeM4eu-Aj1BqMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+M6bXnTB286iFoSFUneGq=1PCJtmnR_PBrqMeM4eu-Aj1BqMA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.com>, lk <linux-kernel@vger.kernel.org>, stable@vger.kernel.org

On Sat, Jan 16, 2016 at 02:11:16PM -0500, Tom Rini wrote:
> On Mon, Dec 7, 2015 at 4:26 PM, Tom Rini <trini@konsulko.com> wrote:
> 
> > Coverity has recently added a check that will find when we don't check
> > the return code from fstat(2).  Copy/paste the checking logic that
> > print_deps() has with an appropriate re-wording of the perror() message.
> >
> > Cc: Michal Marek <mmarek@suse.com>
> > Cc: linux-kbuild@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Tom Rini <trini@konsulko.com>
> >
> > ---
> > Note that I don't have a CID here was I found this in U-Boot and the
> > kernel hasn't yet done a build with this test being enabled.
> > ---
> >  scripts/basic/fixdep.c |    6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
> > index c68fd61..e3d9678 100644
> > --- a/scripts/basic/fixdep.c
> > +++ b/scripts/basic/fixdep.c
> > @@ -274,7 +274,11 @@ static void do_config_file(const char *filename)
> >                 perror(filename);
> >                 exit(2);
> >         }
> > -       fstat(fd, &st);
> > +       if (fstat(fd, &st) < 0) {
> > +               fprintf(stderr, "fixdep: error fstat'ing config file: ");
> > +               perror(filename);
> > +               exit(2);
> > +       }
> >         if (st.st_size == 0) {
> >                 close(fd);
> >                 return;
> 
> 
> Adding stable@ since this applies to 4.4.  Any comments?  Thanks!

Ping?  Thanks!

-- 
Tom
