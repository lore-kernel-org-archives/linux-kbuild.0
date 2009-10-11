Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:52116 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755229AbZJKK3V (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 11 Oct 2009 06:29:21 -0400
Date: Sun, 11 Oct 2009 12:28:44 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: kbuild generating prefix-foo.o from foo.c
Message-ID: <20091011102844.GA969@merkur.ravnborg.org>
References: <f750ee70910082014h3e4b2be1lc98cf0df1b3583af@mail.gmail.com> <f750ee70910082015x46f0f351t2d4651e01ba74ac9@mail.gmail.com> <20091009042829.GA32078@merkur.ravnborg.org> <f750ee70910082237t81eea57y74d992e2da5af792@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f750ee70910082237t81eea57y74d992e2da5af792@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kartikeyan sadasivuni <s.kartikeyan@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Fri, Oct 09, 2009 at 11:07:59AM +0530, kartikeyan sadasivuni wrote:
> hi,
> 
> >
> > Is it an option for you to create a copy of said file?
> 
> I could do this but just looking for a cleaner approach.
> I have a working solution but looking for better ways.
> I wanted to avoid using the line (as kbuild can change in future and
> so c_flags var)
>  $(CC) $(c_flags) -c -o $@ $<
> and call something Kbuild already has
> but  with changed prerequisite/dependency.

Did you read what I suggested at all?
From your answer I think not.

Please go re-read my answer and realize that it is _kbuild_
that reates the copy of the file and thus things *just works*.

kbuild (make) will see that foo.c is missing
and create is using the rule I suggested:

$(obj)/foo: $(src)/foo-prefix.c
	cat $< > $@ || (rm $@ && false)

So you do _not_ have to specify c_flags or anything like that
to make it work.

	Sam
