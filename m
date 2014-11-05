Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:63998 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751302AbaKEGzm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 5 Nov 2014 01:55:42 -0500
MIME-Version: 1.0
Message-ID: <trinity-36be2af2-1224-4ba4-941f-3d8373e34039-1415170537264@3capp-gmx-bs04>
From: "Peter Kuemmel" <syntheticpp@gmx.net>
Subject: Aw: Re: [PATCH] xconfig: Search text should have focus after search
 and reopen
Content-Type: text/plain; charset=UTF-8
Date: Wed, 5 Nov 2014 07:55:37 +0100
In-Reply-To: <1415131872.20372.200.camel@x220>
References: <1415097323-20991-1-git-send-email-syntheticpp@gmx.net>,
 <1415131872.20372.200.camel@x220>
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr

Thx for the hints, hope patches are better now.

Peter

> Gesendet: Dienstag, 04. November 2014 um 21:11 Uhr
> Von: "Paul Bolle" <pebolle@tiscali.nl>
> An: "Peter Kümmel" <syntheticpp@gmx.net>
> Cc: linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr
> Betreff: Re: [PATCH] xconfig: Search text should have focus after search and reopen
>
> On Tue, 2014-11-04 at 11:35 +0100, Peter Kümmel wrote:
> 
> Again, this patch, though smaller that the previous, is not obviously
> trivial. So, could you please add a few lines describing current
> behavior, why it's wrong, and how this patch fixes it? That might
> increase the chance this patch gets some review.
> 
> > Signed-off-by: Peter Kümmel <syntheticpp@gmx.net>
> > ---
> >  scripts/kconfig/qconf.cc | 7 +++++++
> >  scripts/kconfig/qconf.h  | 1 +
> >  2 files changed, 8 insertions(+)
> > 
> > diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> > index 9d3b04b..014df76c 100644
> > --- a/scripts/kconfig/qconf.cc
> > +++ b/scripts/kconfig/qconf.cc
> > @@ -1198,6 +1198,7 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow* parent, const char *nam
> >  	layout2->addWidget(editField);
> >  	searchButton = new QPushButton(_("Search"), this);
> >  	searchButton->setAutoDefault(FALSE);
> > +	searchButton->setFocusPolicy(Qt::NoFocus);
> >  	connect(searchButton, SIGNAL(clicked()), SLOT(search()));
> >  	layout2->addWidget(searchButton);
> >  	layout1->addLayout(layout2);
> > @@ -1235,6 +1236,11 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow* parent, const char *nam
> >  	}
> >  }
> >  
> > +void ConfigSearchWindow::setFocusOnLineEdit()
> > +{
> > +	editField->setFocus(Qt::OtherFocusReason);
> > +}
> > +
> >  void ConfigSearchWindow::saveSettings(void)
> >  {
> >  	if (name()) {
> > @@ -1506,6 +1512,7 @@ void ConfigMainWindow::searchConfig(void)
> >  	if (!searchWindow)
> >  		searchWindow = new ConfigSearchWindow(this, "search");
> >  	searchWindow->show();
> > +	searchWindow->setFocusOnLineEdit();
> >  }
> >  
> >  void ConfigMainWindow::changeMenu(struct menu *menu)
> > diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
> > index bde0c6b..6f2c4d6 100644
> > --- a/scripts/kconfig/qconf.h
> > +++ b/scripts/kconfig/qconf.h
> > @@ -288,6 +288,7 @@ public:
> >  public slots:
> >  	void saveSettings(void);
> >  	void search(void);
> > +	void setFocusOnLineEdit(void);
> >  
> >  protected:
> >  	QLineEdit* editField;
> 
> Thanks,
> 
> 
> Paul Bolle
> 
>
