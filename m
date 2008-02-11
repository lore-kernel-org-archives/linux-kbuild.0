Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from web95105.mail.in2.yahoo.com ([203.104.18.157]:40575 "HELO
	web95105.mail.in2.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752149AbYBKNfx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Feb 2008 08:35:53 -0500
Date: Mon, 11 Feb 2008 13:35:50 +0000 (GMT)
From: murtuja bharmal <murtuja_bharmal@yahoo.com>
Subject: Re: Help Require for makeing 2.6 kernel makefile
In-Reply-To: <20080208192620.GA31391@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <432435.26752.qm@web95105.mail.in2.yahoo.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org


--- Sam Ravnborg <sam@ravnborg.org> wrote:

> On Fri, Feb 08, 2008 at 02:10:34PM +0000, murtuja
> bharmal wrote:
> > Hello Sam,
> > 
> >  Can we write a kernel makefile using KBUILD to
> make
> > kernel module, for which source file are in
> different
> > directory.
> > 
> > For example.
> > In Directory  “test1/” I have a two file Hello1.c
> and
> > Hello2.c
> > First I want to make Hello1.o and Hello2.o and
> after
> > linking it will be Hello3.o. 
> > For Hello3.o output directory will be “test2/”
> > 
> > In Directory “test4/” I have a file Hello4.c,
> after
> > compiling, it will be Hell4.o. 
> > For Hello4.o Output directory will be “test2/”.
> > Now after linking Hell1.o and Hello4.o.  I want to
> > make Hello.ko in directory “test5/”.
> > 
> > Can we have separate makefile for “test1” and
> “test4”
> > directory.
> 
> You cannot achieve exactly what you want - sorry.
> test1/Makefile would look like this:
> obj-m := Hello3.o
> Hello3-y := Hello1.o Hello2.o
> 
> test4/Makefile would look like this:
> obj-m := Hello4.o
> 
> You could create a Makefile in the directory
> above test1/ and test4/ that looks like this:
> 
> obj-m := test1/ test4/
> 
> So you could build both modules in one go.
> And then you could use make modules_install to
> install them.
> 
> Hope this helps.
> 
> PS. Please post such questions to
> linux-kbuild@vger.kernel.org.
> We are a community so use it.
> 
> 	Sam
> 

Hi,

  Actually problem is I have 2000 source file for
single kernel module with 2.4 kbuild architecture.
All this source file are in different directory
sturcture.
I can not split this in to multiple modules.
And In 2.4 makefile it is not tightly binded with
kbuild.
It is like complining some file and linking it,
putting it in some directory and so on and finally
making module from all linked files.
It has near about 100 makefiles for 2.4 architecture.

Now I m not able to findout the way how I will achive
this with 2.6 kbuild system because in all directory
there is one makefile, which is making intermidiate
object file, say form 10 source file, then again at
last we are linking all this intermidate object file
and making a single module.

Murtuja




      Meet people who discuss and share your passions. Go to http://in.promos.yahoo.com/groups
