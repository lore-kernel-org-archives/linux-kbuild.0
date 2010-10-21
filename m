Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:63937 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757042Ab0JUCkc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Oct 2010 22:40:32 -0400
Received: by wwf26 with SMTP id 26so1994037wwf.1
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Oct 2010 19:40:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100911132208.3b11b765.rdunlap@xenotime.net>
References: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
	<1284220282-3500-5-git-send-email-lacombar@gmail.com>
	<20100911132208.3b11b765.rdunlap@xenotime.net>
Date: Wed, 20 Oct 2010 22:40:30 -0400
Message-ID: <AANLkTi=fN94yF=EGYgOmzcETercUkn0hwVcL5_S_qHyo@mail.gmail.com>
Subject: Re: [PATCH 04/15] kconfig: rephrase help texts/comments not to
 include the package name
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi,

I'm revisiting this. Would that make sense to rename "gkc" and "qconf"
to respectively "gconfig" and "xconfig" ? There is copyright from
their respective author associated with each one, so that would have
to be updated also.

Thanks,
 - Arnaud

On Sat, Sep 11, 2010 at 4:22 PM, Randy Dunlap <rdunlap@xenotime.net> wrote:
> On Sat, 11 Sep 2010 11:51:11 -0400 Arnaud Lacombe wrote:
>> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
>> index d669882..1636213 100644
>> --- a/scripts/kconfig/gconf.c
>> +++ b/scripts/kconfig/gconf.c
>> @@ -671,8 +671,7 @@ void on_introduction1_activate(GtkMenuItem * menuitem, gpointer user_data)
>>  {
>>       GtkWidget *dialog;
>>       const gchar *intro_text = _(
>> -         "Welcome to gkc, the GTK+ graphical kernel configuration tool\n"
>> -         "for Linux.\n"
>> +         "Welcome to gkc, the GTK+ graphical configuration tool\n"
>
> Should be "gconfig".  It's never been called "gkc" AFAIK.
>
[...]
>> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
>> index a04e451..fe18f7e 100644
>> --- a/scripts/kconfig/qconf.cc
>> +++ b/scripts/kconfig/qconf.cc
>> @@ -1655,7 +1655,7 @@ void ConfigMainWindow::closeEvent(QCloseEvent* e)
>>
>>  void ConfigMainWindow::showIntro(void)
>>  {
>> -     static const QString str = _("Welcome to the qconf graphical kernel configuration tool for Linux.\n\n"
>> +     static const QString str = _("Welcome to the qconf graphical configuration tool.\n\n"
>
> s/qconf/xconfig/
>
>>               "For each option, a blank box indicates the feature is disabled, a check\n"
>>               "indicates it is enabled, and a dot indicates that it is to be compiled\n"
>>               "as a module.  Clicking on the box will cycle through the three states.\n\n"
>> --
>
>
> ---
> ~Randy
> *** Remember to use Documentation/SubmitChecklist when testing your code ***
>
